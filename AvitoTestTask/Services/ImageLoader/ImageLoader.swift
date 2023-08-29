//
//  ImageLoader.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Сервис для загрузки изображений
final class ImageLoader {
    private let requestSender: RequestSenderInput
    private let imageCache: ImageCache

    /// Инициализирует сервис для загрузки изображений
    /// - Parameter requestSender: Отправитель запросов
    init(requestSender: RequestSenderInput) {
        self.requestSender = requestSender
        imageCache = NSCache()
    }
}

extension ImageLoader: ImageLoaderInput {
    func downloadImage(url: URL) async throws -> UIImage? {
        guard let nsUrl = NSURL(string: url.absoluteString) else { return nil }

        if let image = imageCache.object(forKey: nsUrl) {
            return image
        }

        let data = try await requestSender.download(url: url)

        guard let image = UIImage(data: data) else { return nil }

        imageCache.setObject(image, forKey: nsUrl)

        return image
    }
}
