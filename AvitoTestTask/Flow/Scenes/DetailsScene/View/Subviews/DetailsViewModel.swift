//
//  DetailsViewModel.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Вью-модель подробной информации объявления
struct DetailsViewModel {
    /// Заголовок объявления
    let title: String
    /// Стоимость товара
    let price: String
    /// Местоположение
    let location: String
    /// Ссылка на изображение
//    let imageUrl: String
    /// Дата создания
    let createdDate: String
    /// Описание товара
    let description: String
    /// Адрес электронной почты
    let email: String
    /// Телефонный номер
    let phoneNumber: String
    /// Адрес
    let address: String
}

extension DetailsViewModel {
    /// Пустая вью-модель подробной информации объявления
    static let empty = DetailsViewModel(
        title: "",
        price: "",
        location: "",
        createdDate: "",
        description: "",
        email: "",
        phoneNumber: "",
        address: ""
    )
}
