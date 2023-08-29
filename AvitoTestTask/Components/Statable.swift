//
//  Statable.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Интерфейс для ViewController'ов, которые имеют возможность переключения состояний
protocol Statable {
    /// Состояние ViewController'а
    var state: ViewControllerState { get set }
}
