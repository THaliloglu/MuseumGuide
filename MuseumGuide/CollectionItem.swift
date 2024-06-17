//
//  CollectionItem.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 2.06.2024.
//

import Foundation
import SwiftUI

/// A model representing an item in the museum's collection.
struct CollectionItem: Identifiable, Hashable, Codable, Equatable {
    /// Unique identifier for the collection item.
    var id = UUID()
    
    /// Title of the collection item.
    let title: String
    
    /// Description of the collection item.
    let description: String
    
    /// Model name associated with the collection item.
    let modelName: String
}
