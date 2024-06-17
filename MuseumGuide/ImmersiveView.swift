//
//  ImmersiveView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 30.05.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(AppModel.self) private var appModel
    
    static let markersQuery = EntityQuery(where: .has(PointOfInterestComponent.self))
    static let runtimeQuery = EntityQuery(where: .has(PointOfInterestRuntimeComponent.self))
    
    @State private var subscriptions = [EventSubscription]()
    @State private var attachmentsProvider = AttachmentsProvider()
    @State private var accessibilityInfo = [ObjectIdentifier: (name: String, description: String)]()
    
    var body: some View {
        ZStack {
            RealityView { content, _ in
                // Add the initial RealityKit content
                if let immersiveScene = try? await Entity(named: "ImmersiveScene", in: realityKitContentBundle) {
                    content.add(immersiveScene)
                    
                    subscriptions.append(content.subscribe(to: ComponentEvents.DidAdd.self, componentType: PointOfInterestComponent.self) { event in
                        createLearnMoreView(for: event.entity)
                    })
                    
                    // Add an ImageBasedLight for the immersive content
                    if let resource = try? await EnvironmentResource(named: "ImageBasedLight") {
                        let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                        immersiveScene.components.set(iblComponent)
                        immersiveScene.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveScene))
                    }
                    
                    // Add occluded floor
                    let floor = ModelEntity(
                        mesh: .generatePlane(width: 100, depth: 100),
                        materials: [OcclusionMaterial()]
                    )
                    floor.generateCollisionShapes(recursive: false)
                    floor.components[PhysicsBodyComponent.self] = PhysicsBodyComponent(
                        massProperties: .default,
                        material: .generate(staticFriction: 0.8, dynamicFriction: 0.0, restitution: 0.0),
                        mode: .kinematic
                    )
                    content.add(floor)
                    
                    for yPos in stride(from: 0.1, through: 2.0, by: 0.4) {
                        let showCaseFloor = createFloor(for: Float(yPos))
                        content.add(showCaseFloor)
                    }
                    
                    // Add point of interest components to entities
                    appModel.collectionItems.forEach { item in
                        if let entity = immersiveScene.findEntity(named: item.modelName) {
                            entity.components[PointOfInterestComponent.self] = PointOfInterestComponent(
                                name: item.title,
                                description: item.description
                            )
                        }
                    }
                }
            } update: { content, attachments in
                // Update attachment entities for marked entities
                content.entities.first?.scene?.performQuery(Self.runtimeQuery).forEach { entity in
                    guard let component = entity.components[PointOfInterestRuntimeComponent.self],
                          let attachmentEntity = attachments.entity(for: component.attachmentTag),
                          attachmentEntity.parent == nil else { return }
                    
                    entity.addChild(attachmentEntity)
                    attachmentEntity.setPosition([0.0, 0.6, 0.0], relativeTo: entity)
                }
            } attachments: {
                ForEach(attachmentsProvider.sortedTagViewPairs, id: \.tag) { pair in
                    let info = accessibilityInfo[pair.tag]
                    Attachment(id: pair.tag) {
                        pair.view
                            .accessibilityElement(children: .combine)
                            .accessibilityLabel(info?.name ?? "")
                            .accessibilityHint(info?.description ?? "")
                    }
                }
            }
            .gesture(DragGesture()
                .targetedToAnyEntity()
                .onChanged { value in
                    value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
                    value.entity.components[PhysicsBodyComponent.self]?.mode = .kinematic
                }
                .onEnded { value in
                    value.entity.components[PhysicsBodyComponent.self]?.mode = .dynamic
                }
            )
        }
        .onAppear {
            appModel.isShowingImmersive = true
            UIAccessibility.post(notification: .announcement, argument: "Entering immersive view. Swipe to explore.")
        }
        .onDisappear {
            appModel.isShowingImmersive = false
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Immersive View")
        .accessibilityHint("Displays an immersive 3D environment with points of interest.")
    }
    
    /// Creates a "Learn More" view for a given entity.
    private func createLearnMoreView(for entity: Entity) {
        guard entity.components[PointOfInterestRuntimeComponent.self] == nil,
              let pointOfInterest = entity.components[PointOfInterestComponent.self] else { return }
        
        let tag: ObjectIdentifier = entity.id
        let name = pointOfInterest.name
        let description = pointOfInterest.description ?? ""
        
        let view = LearnMoreView(name: name, description: description).tag(tag)
        
        entity.components[PointOfInterestRuntimeComponent.self] = PointOfInterestRuntimeComponent(attachmentTag: tag)
        attachmentsProvider.attachments[tag] = AnyView(view)
        accessibilityInfo[tag] = (name: name, description: description)
    }
    
    /// Creates a floor entity for the showcase.
    private func createFloor(for y: Float, isDebug: Bool = false) -> ModelEntity {
        let showCaseFloor = ModelEntity(
            mesh: .generatePlane(width: 0.95, depth: 0.35),
            materials: [SimpleMaterial(color: .random, isMetallic: true)]
        )
        showCaseFloor.generateCollisionShapes(recursive: false)
        showCaseFloor.components[PhysicsBodyComponent.self] = PhysicsBodyComponent(massProperties: .default, mode: .static)
        showCaseFloor.position.y = y
        showCaseFloor.position.z = -1.85
        return showCaseFloor
    }
}

#Preview(immersionStyle: .progressive) {
    ImmersiveView()
        .environment(AppModel())
}
