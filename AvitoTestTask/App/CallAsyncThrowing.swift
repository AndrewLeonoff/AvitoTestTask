//
//  CallAsyncThrowing.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Вызывает `execution` асинхронно, переносит возвращаемое значение в `Result` и передает его в `completion`, отправленный в указанную очередь.
/// - Parameters:
///   - queue: Очередь для отправки замыкания о завершении
///   - execution: Асинхронное замыкание для выполнения
///   - completion: Обработчик завершения
/// - Returns: Созданная задача
@discardableResult
func callAsyncThrowing<T>(
    _ queue: DispatchQueue = .main,
    execution: @escaping () async throws -> T,
    completion: @escaping (Result<T, Error>) -> Void
) -> Task<(), Never> {
    Task {
        let result: Result<T, Error>
        do {
            result = .success(try await execution())
        } catch {
            result = .failure(error)
        }
        queue.async {
            completion(result)
        }
    }
}
