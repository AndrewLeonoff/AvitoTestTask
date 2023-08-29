//
//  ActionHandlerInput.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Интерфейс обработчика действий
protocol ActionHandlerInput {
    /// Вызывает диалог с предложением позвонить по указанному телефонному номеру
    /// - Parameter phoneNumber: Телефонный номер
    /// - Returns: Флаг успешной обработки
    func callTo(_ phoneNumber: String) -> Bool

    /// Открывает почтовое приложение для написания письма по указанному адресу
    /// - Parameter emailAddress: Email адрес
    /// - Returns: Флаг успешной обработки
    func emailTo(_ emailAddress: String) -> Bool
}
