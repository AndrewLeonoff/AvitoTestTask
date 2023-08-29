//
//  ListServiceInput.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Интерфейс сервиса списка объявлений
protocol ListServiceInput: AnyObject {
    /// Делает запрос списка объявлений
    /// - Returns: Схема списка объявлений
    func requestList() async throws -> ListSchema
}
