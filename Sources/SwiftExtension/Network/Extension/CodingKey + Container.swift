//
//  CodingKey + Container.swift
//  
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension CodingKey {
    /// Получает контейнер для декодирования на основе ключей текущего типа `CodingKey`.
    ///
    /// Этот метод упрощает получение контейнера для декодирования, используя тип `Self` в качестве ключа.
    ///
    /// - Parameter decoder: Декодер, из которого нужно получить контейнер.
    /// - Returns: Контейнер для декодирования, настроенный с ключами текущего типа `CodingKey`.
    /// - Throws: Ошибка декодирования, если контейнер не может быть создан.
    static func getContainer(decoder: Decoder) throws -> KeyedDecodingContainer<Self> {
        return try decoder.container(keyedBy: Self.self)
    }
}
