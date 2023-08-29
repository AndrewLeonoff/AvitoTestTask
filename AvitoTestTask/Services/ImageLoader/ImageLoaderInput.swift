//
//  ImageLoaderInput.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

typealias ImageCache = NSCache<NSURL, UIImage>

protocol ImageLoaderInput: AnyObject {
    /// Делает запрос на загрузку изображения
    /// - Parameter url: Ссылка
    /// - Returns: Изображение
    func downloadImage(url: URL) async throws -> UIImage?
}
