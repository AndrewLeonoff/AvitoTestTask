//
//  Presentable.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Протокол описывает объект, который будет отображаться с помощью Router'a
protocol Presentable {
    /// Возвращает ViewController, который предназначен для отображения контента
    /// - Returns: ViewController для отображения контента
    func toPresent() -> UIViewController?
}
