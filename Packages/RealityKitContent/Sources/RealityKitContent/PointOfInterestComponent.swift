import RealityKit

// Ensure you register this component in your app’s delegate using:
// PointOfInterestComponent.registerComponent()
public struct PointOfInterestComponent: Component, Codable {
    
    public var name: String = "Learn More"
    
    public var description: String? = nil
    
    public init(name: String, description: String? = nil) {
        self.name = name
        self.description = description
    }
}
