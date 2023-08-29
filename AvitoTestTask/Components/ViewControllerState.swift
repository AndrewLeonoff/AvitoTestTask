//
//  ViewControllerState.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Состояние ViewController'а
enum ViewControllerState {
    /// Нормальное состояние отображения контента
    case content
    /// Состояние загрузки
    case loading(title: String?)
    /// Состояние отображения ошибки
    case error(title: String?, buttonTitle: String?)
}
