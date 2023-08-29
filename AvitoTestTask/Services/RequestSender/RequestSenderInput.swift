//
//  RequestSenderInput.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Интерфейс отправителя запросов
protocol RequestSenderInput: AnyObject {
    /// Делает запрос `GET`
    /// - Parameter url: Ссылка
    /// - Returns: Схема ответа запроса
    func get<Schema: Decodable>(url: URL) async throws -> Schema

    /// Делает запрос на загрузку данных
    /// - Parameter url: Ссылка
    /// - Returns: Ответ запроса в виде объекта `Data`
    func download(url: URL) async throws -> Data
}
