//
//  ActionHandler.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Обработчик действий
final class ActionHandler: ActionHandlerInput {
    func callTo(_ phoneNumber: String) -> Bool {
        let numbers = phoneNumber.components(separatedBy: .decimalDigits.inverted).joined()
        guard let url = URL(string: "telprompt://\(numbers)"), UIApplication.shared.canOpenURL(url)
        else { return false }

        UIApplication.shared.open(url)

        return true
    }

    func emailTo(_ emailAddress: String) -> Bool {
        guard let url = URL(string: "mailto:\(emailAddress)"), UIApplication.shared.canOpenURL(url)
        else { return false }

        UIApplication.shared.open(url)

        return true
    }
}
