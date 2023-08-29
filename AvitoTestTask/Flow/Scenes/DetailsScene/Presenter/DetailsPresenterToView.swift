//
//  DetailsPresenterToView.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Интерфейс обращений презентера подробной информации объявления ко вьюхе
protocol DetailsPresenterToView: AnyObject, Statable {
    /// Обновляет контент
    /// - Parameter viewModel: Вью-модель с контентом
    func updateContent(with viewModel: DetailsViewModel)

    /// Устанавливает изображение
    /// - Parameter image: Изображение
    func setImage(_ image: UIImage)

    /// Показывает алерт
    /// - Parameters:
    ///   - title: Заголовок алерта
    ///   - message: Сообщение алерта
    func presentAlert(title: String?, message: String?)
}
