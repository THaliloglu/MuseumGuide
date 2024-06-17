//
//  ColorExtension.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 17.06.2024.
//

import Foundation
import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
