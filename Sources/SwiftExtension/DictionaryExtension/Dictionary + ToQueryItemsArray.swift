//
//  Dictionary + ToQueryItemsArray.swift
//
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension Dictionary where Value: CustomStringConvertible, Key == String {
    /// Преобразует словарь в массив `URLQueryItem`.
    /// - Returns: Массив `URLQueryItem`, где ключи словаря становятся именами, а значения - значениями с использованием `.description`.
    public func toQueryItemsArray() -> [URLQueryItem] {
        return map { URLQueryItem(name: $0.key, value: $0.value.description) }
    }
}
