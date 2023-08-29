//
//  Router.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Протокол описывает роутер для навигации приложения
protocol Router {
    /// Устанавливает корневой экран в навигационный стек
    /// - Parameter scene: Корневой экран
    func setRootModule(_ scene: Presentable?)

    /// Добавляет в навигационный стек новый экран
    /// - Parameter scene: Новый экран
    func push(_ scene: Presentable?)
}
