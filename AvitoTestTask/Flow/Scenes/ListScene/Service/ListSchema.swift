//
//  ListSchema.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

struct ListSchema: Decodable {
    let advertisements: [Advertisement]
}

extension ListSchema {
    /// Схема рекламного объявления
    struct Advertisement: Decodable {
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
    }
}

extension ListSchema.Advertisement {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case location
        case imageUrl = "image_url"
        case createdDate = "created_date"
    }
}
