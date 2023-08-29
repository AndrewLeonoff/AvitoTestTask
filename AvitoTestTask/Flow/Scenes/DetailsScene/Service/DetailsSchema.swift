//
//  DetailsSchema.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Схема подробной информации объявления
struct DetailsSchema: Decodable {
    /// Идентификатор объявления
    let id: String
    /// Заголовок объявления
    let title: String
    /// Стоимость товара
    let price: String
    /// Местоположение
    let location: String
    /// Ссылка на изображение
    let imageUrl: String
    /// Дата создания
    let createdDate: Date
    /// Описание товара
    let description: String
    /// Адрес электронной почты
    let email: String
    /// Телефонный номер
    let phoneNumber: String
    /// Адрес
    let address: String
}

extension DetailsSchema {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case location
        case imageUrl = "image_url"
        case createdDate = "created_date"
        case description
        case email
        case phoneNumber = "phone_number"
        case address
    }
}
