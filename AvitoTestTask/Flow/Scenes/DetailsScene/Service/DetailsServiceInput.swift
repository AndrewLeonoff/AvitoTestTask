//
//  DetailsServiceInput.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Интерфейс сервиса подробной информации объявления
protocol DetailsServiceInput: AnyObject {
    /// Делает запрос подробной информации объявления
    /// - Parameter id: Идентификатор объявления
    /// - Returns: Схема подробной информации объявления
    func requestDetails(id: String) async throws -> DetailsSchema
}
