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
    /// The currently selected collection item.
    var currentItem: CollectionItem?
    
    // MARK: - Collection Volume
    /// A Boolean value indicating whether the volume view is being shown.
    var isShowingVolume: Bool = false
    
    // MARK: - ImmersiveSpace
    /// A Boolean value indicating whether the immersive space view is being shown.
    var isShowingImmersive: Bool = false
    
    // MARK: - Collection Items
    /// The collection items displayed in the app.
    var collectionItems: [CollectionItem] = [
        CollectionItem(
            title: "Aphrodite of Milos",
            description: "The Aphrodite of Milos, also known as the Venus de Milo, is an ancient Greek statue and one of the most famous works of ancient Greek sculpture. Created sometime between 130 and 100 BC, it is believed to depict Aphrodite, the Greek goddess of love and beauty.",
            modelName: "aphrodite"
        ),
        CollectionItem(
            title: "Clock shaped as a highlander’s cottage",
            description: "This unique clock is crafted in the shape of a highlander’s cottage, showcasing intricate details and craftsmanship. It represents a blend of functionality and artistic design from the 19th century.",
            modelName: "clock"
        ),
        CollectionItem(
            title: "Counter for writing accessories of a city scribe",
            description: "This counter was used by city scribes to store their writing accessories. It features compartments for inkwells, quills, and parchment, and is a fine example of the practical yet elegant designs from the Renaissance period.",
            modelName: "counter"
        ),
        CollectionItem(
            title: "Royal Crown",
            description: "This royal crown is adorned with precious gems and intricate designs, symbolizing power and authority. It dates back to the 17th century and was worn by monarchs during significant ceremonial events.",
            modelName: "crown"
        ),
        CollectionItem(
            title: "Polovtsian Baba",
            description: "The Polovtsian Baba is a stone statue representing a warrior from the Polovtsian (Cuman) culture. These statues, found in Eastern Europe, date back to the 11th and 12th centuries and were used as grave markers or commemorative monuments.",
            modelName: "polovtsianBaba"
        ),
        CollectionItem(
            title: "Pustki Hill",
            description: "Pustki Hill is a historical site with significant archaeological finds. The hill has revealed numerous artifacts from different periods, providing insights into the region’s ancient civilizations and their way of life.",
            modelName: "pustkiHill"
        ),
        CollectionItem(
            title: "Young Centaur (Smiling Centaur)",
            description: "This sculpture depicts a young centaur, a mythical creature that is half human, half horse. Known as the Smiling Centaur, this piece captures the mythical being in a moment of joy, showcasing the artist's skill in conveying emotion through stone.",
            modelName: "sculptureCentaur"
        ),
        CollectionItem(
            title: "Bust of Róża Loewenfeld",
            description: "This bust represents Róża Loewenfeld, a prominent figure in her time. The detailed sculpture captures her likeness with remarkable precision, reflecting the artistic talent of the sculptor and providing a glimpse into the era's portraiture techniques.",
            modelName: "sculptureLoewenfeld"
        ),
        CollectionItem(
            title: "St. Anna",
            description: "The sculpture of St. Anna is a revered piece representing the mother of the Virgin Mary. This religious artwork is noted for its detailed carving and historical significance in Christian art.",
            modelName: "sculptureSt"
        ),
        CollectionItem(
            title: "Three-crossbeam cross",
            description: "This three-crossbeam cross is a distinctive religious symbol used in Eastern Orthodox Christianity. Its unique design, featuring three horizontal beams, each with specific symbolic meanings, makes it an important artifact for religious studies.",
            modelName: "threeCrossbeamCross"
        ),
        CollectionItem(
            title: "Vaso d'Amore (Vaso da fiori)",
            description: "The Vaso d'Amore, also known as the Vaso da fiori, is a beautifully crafted flower vase. This elegant piece, adorned with artistic motifs, reflects the craftsmanship and aesthetic preferences of the Baroque period.",
            modelName: "vasoFiori"
        ),
        CollectionItem(
            title: "Wolf skull",
            description: "This wolf skull is an important archaeological find, providing insights into the fauna of past eras. It serves as a significant piece for the study of animal biology and the history of species in the region.",
            modelName: "wolfSkull"
        )
    ]
}
