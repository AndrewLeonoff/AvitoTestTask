//
//  UIColor+dynamicColor.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

extension UIColor {
    /// Создает динамический цвет в зависимости от `traitCollection`
    /// - Parameters:
    ///   - light: Цвет, используемый в светлой теме
    ///   - dark: Цвет, используемый в темной теме
    /// - Returns: Цвет в зависимости от `traitCollection`
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        UIColor {
            $0.userInterfaceStyle == .dark ? dark : light
        }
    }
}
