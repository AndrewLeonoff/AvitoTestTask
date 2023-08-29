//
//  ListPresenterToView.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Интерфейс обращений презентера списка объявлений ко вьюхе
protocol ListPresenterToView: AnyObject, Statable {
    /// Устанавливает изображение
    /// - Parameters:
    ///   - image: Изображение
    ///   - indexPath: Индекс ячейки
    func setImage(_ image: UIImage, for indexPath: IndexPath)
}
