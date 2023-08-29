//
//  ListPresenterToCoordinator.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Интерфейс обращений презентера к координатору
protocol ListPresenterToCoordinator: AnyObject {
    /// Извещает о необходимости показа сцены подробной информации объявления
    /// - Parameter id: Идентификатор объявления
    func presentDetailsScene(for id: String)
}
