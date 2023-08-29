//
//  Palette.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Простраство имен палитры цветов
enum Palette {
    /// Пространство имен цветов для текста
    enum Text {
        /// Цвет основного текста
        static let primary = UIColor.dynamicColor(light: .black, dark: .white)
        /// Цвет вторичного текста
        static let secondary = UIColor.gray
    }

    /// Пространство имен цветов для фона
    enum Background {
        /// Цвет основного фона
        static let base = UIColor.dynamicColor(light: .white, dark: .black)
        /// Цвет фона "положительных" элементов
        static let positive = UIColor.systemGreen
        /// Цвет фона информационных элементов
        static let info = UIColor.systemBlue
    }
}
