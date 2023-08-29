//
//  UIView+addSubviewAndPinToEdges.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

extension UIView {
    /// Добавляет вьюху и устанавливает констрейнты к краям родительской вьюхи
    /// - Parameter view: Добавляемая вьюха
    func addSubviewAndPinToEdges(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
}
