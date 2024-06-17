//
//  AppModel.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 6.06.2024.
//

import SwiftUI

/// The data that the app uses to configure its views.
@Observable
class AppModel {
    
    // MARK: - Navigation
    var currentItem: CollectionItem?
    
    // MARK: - Collection Volume
    var isShowingVolume: Bool = false
    
    // MARK: - ImmersiveSpace
    var isShowingImmersive: Bool = false
    
    var collectionItems = [
        CollectionItem(title: "Aphrodite of Milos", description: "Detailed information about Aphrodite of Milos.", modelName: "aphrodite"),
        CollectionItem(title: "Clock shaped as a highlander’s cottage", description: "Detailed information about Clock shaped as a highlander’s cottage.", modelName: "clock"),
        CollectionItem(title: "Counter for writing accessories of a city scribe", description: "Detailed information about Counter for writing accessories of a city scribe.", modelName: "counter"),
        CollectionItem(title: "Royal Crown", description: "Detailed information about Royal Crown.", modelName: "crown"),
        CollectionItem(title: "Polovtsian Baba", description: "Detailed information about Polovtsian Baba.", modelName: "polovtsianBaba"),
        CollectionItem(title: "Pustki Hill", description: "Detailed information about Pustki Hill.", modelName: "pustkiHill"),
        CollectionItem(title: "Young Centaur (Smiling Centaur)", description: "Detailed information about Young Centaur (Smiling Centaur).", modelName: "sculptureCentaur"),
        CollectionItem(title: "Bust of Róża Loewenfeld", description: "Detailed information about Bust of Róża Loewenfeld.", modelName: "sculptureLoewenfeld"),
        CollectionItem(title: "St. Anna", description: "Detailed information about St. Anna.", modelName: "sculptureSt"),
        CollectionItem(title: "Three-crossbeam cross", description: "Detailed information about Three-crossbeam cross.", modelName: "threeCrossbeamCross"),
        CollectionItem(title: "Vaso d'Amore (Vaso da fiori)", description: "Detailed information about Vaso d'Amore (Vaso da fiori).", modelName: "vasoFiori"),
        CollectionItem(title: "Wolf skull", description: "Detailed information about Wolf skull.", modelName: "wolfSkull")
    ]
}
