//
//  Array + HeaderKey.swift
//
//
//  Created by Святослав Спорыхин on 20.08.2024.
//

import Foundation

//MARK: - Element == HeaderKey
extension Array where Element == HTTPHeader {
    /// Инициализатор для создания массива HTTP-заголовков на основе массивов заголовков и словаря.
    /// - Parameters:
    ///   - headerKeyGroups: Массив массивов заголовков.
    ///   - headersDictionary: Словарь, содержащий заголовки в виде пар ключ-значение.
    public init(
        headerKeyGroups: [[HTTPHeader]],
        headers: [String: String] = [:]
    ) {
        self = headerKeyGroups.reduce([], { $0 + $1 }) + Array<Element>(headers: headers)
    }
    
    /// Инициализатор для создания массива HTTP-заголовков на основе словаря.
    /// - Parameter headersDictionary: Словарь, содержащий заголовки в виде пар ключ-значение.
    public init(
        headers: [String: String] = [:]
    ) {
        self = headers.map({ dict in
            return HTTPHeader(key: dict.key, value: dict.value)
        })
    }
    
    /// Преобразует массив заголовков в словарь.
    /// - Returns: Словарь, содержащий заголовки в виде пар ключ-значение.
    public func toDictionary() -> [String: String] {
        return self.reduce([:]) { partialResult, value -> [String: String] in
            var newPartialResult = partialResult
            newPartialResult[value.key] = value.value
            return newPartialResult
        }
    }
}
