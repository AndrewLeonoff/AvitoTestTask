//
//  RequestSender.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Отправитель запросов
final class RequestSender {
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter
    }()

    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        return decoder
    }()
}

// MARK: - RequestSenderInput

extension RequestSender: RequestSenderInput {
    func get<Schema: Decodable>(url: URL) async throws -> Schema {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw RequestSenderError.invalidServerResponse
        }

        guard let schema = try? decoder.decode(Schema.self, from: data) else {
            throw RequestSenderError.responseJSONDecodeError
        }

        return schema
    }

    func download(url: URL) async throws -> Data {
        let (location, response) = try await URLSession.shared.download(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw RequestSenderError.invalidServerResponse
        }

        return try Data(contentsOf: location)
    }
}
