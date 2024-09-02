//
//  KeyedDecodingContainer + Decode.swift
//
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension KeyedDecodingContainer {
    
    /// Декодирует значение по ключу
    /// - Parameter key: Ключ который ожидается в ответе
    /// - Returns: Возвращает любой декодируемый тип
    func decodeValue<T: Decodable>(
        for key: KeyedDecodingContainer<K>.Key
    ) throws -> T {
        return try decode(T.self, forKey: key)
    }
    
    /// Декодирует опциональное значение по ключу.
    /// - Parameter key: Ключ, который ожидается в ответе.
    /// - Returns: Опциональное декодированное значение указанного типа.
    func decodeOptional<T: Decodable>(
        for key: KeyedDecodingContainer<K>.Key
    ) -> T? {
        return try? decode(T.self, forKey: key)
    }
}
