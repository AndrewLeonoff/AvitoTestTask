//
//  RequestSenderError.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Ошибка отправителя запроса
enum RequestSenderError: Error {
    /// Ошибка ответа сервера
    case invalidServerResponse
    /// Ошибка декодирования JSON
    case responseJSONDecodeError
    /// Неизвестная ошибка
    case unknown
}

extension RequestSenderError: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidServerResponse:
            return "Ошибка ответа сервера"
        case .responseJSONDecodeError:
            return "Ошибка декодирования JSON"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}
