//
//  CardViewModel.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Вью-модель карточки объявления
struct CardViewModel {
    /// Идентификатор объявления
    let id: String
    /// Заголовок объявления
    let title: String
    /// Стоимость товара
    let price: String
    /// Адрес
    let location: String
    /// Ссылка на изображение
    var imageUrl: String
    /// Дата создания
    let createdDate: String
    /// Изображение
    var image: UIImage?
}

extension CardViewModel {
    /// Пустая вью-модель карточки объявления
    static let empty = CardViewModel(
        id: "",
        title: "",
        price: "",
        location: "",
        imageUrl: "",
        createdDate: "",
        image: nil
    )
}
