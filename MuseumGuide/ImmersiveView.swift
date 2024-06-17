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
    
    var body: some View {
        ZStack {
            RealityView { content, _ in
                // Add the initial RealityKit content
                if let immersiveScene = try? await Entity(named: "ImmersiveScene", in: realityKitContentBundle) {
                    content.add(immersiveScene)
                    
                    subscriptions.append(content.subscribe(to: ComponentEvents.DidAdd.self, componentType: PointOfInterestComponent.self, { event in
                        createLearnMoreView(for: event.entity)
                    }))
                    
                    // Add an ImageBasedLight for the immersive content
                    guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                    let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                    immersiveScene.components.set(iblComponent)
                    immersiveScene.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveScene))
                    
                    /* Occluded floor */
                    let floor = ModelEntity(
                        mesh: .generatePlane(width: 100, depth: 100),
                        materials: [
                            OcclusionMaterial()
                        ]
                    )
                    floor.generateCollisionShapes(recursive: false)
                    floor.components[PhysicsBodyComponent.self] = .init(
                      PhysicsBodyComponent(
                        massProperties: .default,
                        material: .generate(
                          staticFriction: 0.8,
                          dynamicFriction: 0.0,
                          restitution: 0.0
                        ),
                        mode: .kinematic
                      )
                    )
                    content.add(floor)
                    
                    for yPos in stride(from: 0.1, through: 2.0, by: 0.4) {
                        let showCaseFloor = createFloor(for: Float(yPos))
                        content.add(showCaseFloor)
                    }
                    
                    appModel.collectionItems.forEach { item in
                        if let entity = immersiveScene.findEntity(named: item.modelName) {
                            entity.components[PointOfInterestComponent.self] = .init(
                                name: item.title,
                                description: item.description
                            )
                        }
                    }
                }
            } update: { content, attachments in
                // Add attachment entities to marked entities. First, find all entities that have the
                // PointOfInterestRuntimeComponent, which means they've created an attachment.
                content.entities.first?.scene?.performQuery(Self.runtimeQuery).forEach { entity in

                    guard let component = entity.components[PointOfInterestRuntimeComponent.self] else { return }

                    // Get the entity from the collection of attachments keyed by tag.
                    guard let attachmentEntity = attachments.entity(for: component.attachmentTag) else { return }

                    guard attachmentEntity.parent == nil else { return }

                    // SwiftUI calculates an attachment view's expanded size using the top center as the pivot point. This
                    // raises the views so they aren't sunk into the terrain in their initial collapsed state.
                    entity.addChild(attachmentEntity)
                    attachmentEntity.setPosition([0.0, 0.6, 0.0], relativeTo: entity)
                }
            } attachments: {
                ForEach(attachmentsProvider.sortedTagViewPairs, id: \.tag) { pair in
                    Attachment(id: pair.tag) {
                        pair.view
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
        }
        .onDisappear {
            appModel.isShowingImmersive = false
        }
    }
    
    private func createLearnMoreView(for entity: Entity) {
        
        // If this entity already has a RuntimeComponent, don't add another one.
        guard entity.components[PointOfInterestRuntimeComponent.self] == nil else { return }
        
        // Get this entity's PointOfInterestComponent, which is in the Reality Composer Pro project.
        guard let pointOfInterest = entity.components[PointOfInterestComponent.self] else { return }
        
        let tag: ObjectIdentifier = entity.id
        
        let name = LocalizedStringResource(stringLiteral: pointOfInterest.name)
        let description = LocalizedStringResource(stringLiteral: pointOfInterest.description ?? "")
        
        let view = LearnMoreView(name: String(localized: name),
                                 description: String(localized: description))
            .tag(tag)
        
        entity.components[PointOfInterestRuntimeComponent.self] = PointOfInterestRuntimeComponent(attachmentTag: tag)
        
        attachmentsProvider.attachments[tag] = AnyView(view)
    }
    
    private func createFloor(for y: Float, isDebug: Bool = false) -> ModelEntity {
        let showCaseFloor = ModelEntity(
            mesh: .generatePlane(width: 0.95, depth: 0.35),
            materials: [
                SimpleMaterial(color: .random, isMetallic: true)
            ]
        )
        showCaseFloor.generateCollisionShapes(recursive: false)
        showCaseFloor.components[PhysicsBodyComponent.self] = .init(
            massProperties: .default,
            mode: .static
        )
        showCaseFloor.position.y = y
        showCaseFloor.position.z = -1.85
        return showCaseFloor
    }
}

#Preview(immersionStyle: .progressive) {
    ImmersiveView()
        .environment(AppModel())
}
