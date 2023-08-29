//
//  DetailsService.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Сервис получения подробной информации объявления
final class DetailsService {
    private let requestSender: RequestSenderInput

    /// Инициализирует сервис подробной информации объявления
    /// - Parameter requestSender: Отправитель запросов
    init(requestSender: RequestSenderInput) {
        self.requestSender = requestSender
    }
}

// MARK: - DetailsServiceInput

extension DetailsService: DetailsServiceInput {
    func requestDetails(id: String) async throws -> DetailsSchema {
        guard let url = URL(string: "https://www.avito.st/s/interns-ios/details/\(id).json") else {
            throw RequestSenderError.unknown
        }

        let schema: DetailsSchema = try await requestSender.get(url: url)

        return schema
    }
}
