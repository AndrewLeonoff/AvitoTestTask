//
//  SceneAssembly.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Интерфейс сборщика сцен
protocol SceneAssembly {
    /// Собирает сцену со списком объявлений
    /// - Parameter coordinator: Координатор
    /// - Returns: Сцена со списком объявлений
    func makeListScene(coordinator: ListPresenterToCoordinator) -> Presentable

    /// Собирает сцену с подробной информацией объявления
    /// - Parameter id: Идентификатор объявления
    /// - Returns: Сцена с подробной информацией объявления
    func makeDetailsScene(for id: String) -> Presentable
}
