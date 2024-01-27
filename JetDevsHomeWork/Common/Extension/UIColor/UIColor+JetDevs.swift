//
//  UIColor+JetDevs.swift
//  JetDevsHomeWork
//
//  Created by ihsan on 28/01/24.
//

import Foundation

import UIKit

extension UIColor {
    /**
     Create UIColor from Hex
     */
    convenience init(hex: String, alpha: CGFloat = 1) {
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0xFF00) >> 8) / 255.0,
            blue: CGFloat((rgb & 0xFF)) / 255.0,
            alpha: alpha)
    }

    // MARK: Custom Color
    static let PrimaryColor = UIColor(hex: "#28518D")
    static let GrayDisable = UIColor(hex: "#BDBDBD")
}
