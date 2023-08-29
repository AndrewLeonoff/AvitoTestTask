//
//  ListService.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Сервис получения списка объявлений
final class ListService {
    private let requestSender: RequestSenderInput

    /// Инициализирует получения списка объявлений
    /// - Parameter requestSender: Отправитель запросов
    init(requestSender: RequestSenderInput) {
        self.requestSender = requestSender
    }
}

// MARK: - ListServiceInput

extension ListService: ListServiceInput {
    func requestList() async throws -> ListSchema {
        guard let url = URL(string: "https://www.avito.st/s/interns-ios/main-page.json") else {
            throw RequestSenderError.unknown
        }

        let schema: ListSchema = try await requestSender.get(url: url)

        return schema
    }
}
