//
//  DetailsPresenterInput.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Интерфейс для презентера подробной информации объявления
protocol DetailsPresenterInput: AnyObject {
    /// Извещает о загрузке ViewController'а
    func didLoad()

    /// Извещает о нажатии на кнопку обновления контента
    func didUpdateButtonTap()

    /// Извещает о нажатии на кнопку `Позвонить`
    func didCallButtonTap()

    /// Извещает о нажатии на кнопку `Написать`
    func didEmailButtonTap()
}
