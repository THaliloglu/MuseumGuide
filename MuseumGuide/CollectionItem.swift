//
//  CollectionItem.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 2.06.2024.
//

import Foundation
import SwiftUI

struct CollectionItem: Identifiable, Hashable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    let modelName: String
}
