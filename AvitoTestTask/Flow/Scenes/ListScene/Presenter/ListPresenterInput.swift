//
//  ListPresenterInput.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Интерфейс для презентера списка объявлений
protocol ListPresenterInput: AnyObject {
    /// Количество объявлений
    var itemCount: Int { get }

    /// Список вью-моделей
    var viewModels: [CardViewModel] { get }

    /// Извещает о загрузке ViewController'а
    func didLoad()

    /// Извещает о нажатии на кнопку обновления контента
    func didUpdateButtonTap()

    /// Извещает о нажатии на карточку
    /// - Parameter indexPath: Индекс ячейки
    func didCardTap(indexPath: IndexPath)

    func loadImage(id: String)
}
