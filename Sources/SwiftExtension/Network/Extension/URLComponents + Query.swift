//
//  URLComponents + Query.swift
//
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension URLComponents {
    /// Возвращает новые `URLComponents` с добавленным массивом `URLQueryItem`.
    ///
    /// - Parameter items: Массив `URLQueryItem`, который нужно добавить к `URLComponents`.
    /// - Returns: Возвращает обновленные `URLComponents` с добавленными query-параметрами.
    public func appendingQueryItems(
        items: [URLQueryItem]
    ) -> URLComponents {
        var components = self
        components.queryItems = items
        return components
    }

    /// Добавляет параметры запроса или преобразует тело запроса в зависимости от формата результата.
    ///
    /// - Parameter result: `HTTPRequestBodyFormat`, который определяет формат данных для тела запроса.
    /// - Returns: Обновленные `URLComponents` с добавленными query-параметрами, если они предусмотрены форматом.
    public func appendingQueryItemsForFormat(
        result: HTTPRequestBodyFormat
    ) -> URLComponents {
        switch result {
        case .form, .json:
            return self
        case .queryParameters(let array):
            return appendingQueryItems(items: array)
        case .jsonWithParameters(_, let array):
            return appendingQueryItems(items: array)
        }
    }
}
