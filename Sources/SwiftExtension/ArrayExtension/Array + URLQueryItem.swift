//
//  Array + URLQueryItem.swift
//
//
//  Created by Святослав Спорыхин on 20.08.2024.
//

import Foundation

//MARK: - NonEmptyProtocol
extension Array: NonEmptyProtocol {}

//MARK: - Element == URLQueryItem
extension Array where Element == URLQueryItem {
    /// Добавляет значение в массив, если оно не `nil`.
    /// - Parameters:
    ///   - value: Значение, которое должно быть добавлено (с использованием .description).
    ///   - key: Ключ, к которому значение принадлежит.
    /// - Returns: Массив с добавленным элементом `URLQueryItem`, если значение присутствует.
    public func addingQueryItemIfPresent<T: CustomStringConvertible>(
        value: T?,
        key: String
    ) -> Array<Element> {
        guard let value = value else {
            return self
        }
        return self.addToTail([URLQueryItem(name: key, value: value.description)])
    }
    
    /// Добавляет элементы из словаря в массив `URLQueryItem`.
    /// - Parameter dict: Словарь, который нужно преобразовать.
    /// - Returns: Массив с добавленными элементами `URLQueryItem`, преобразованными из словаря.
    public func addingQueryItemsFromDictionary<T: CustomStringConvertible>(
        _ dict: [String: T]
    ) -> Array<Element> {
        return self.addToTail(dict.toQueryItemsArray())
    }
    
    /// Добавляет элементы массива в `URLQueryItem` с общим ключом.
    /// - Parameters:
    ///   - array: Массив элементов, которые должны быть преобразованы (с использованием .description).
    ///   - key: Общий ключ для всех элементов.
    /// - Returns: Массив с добавленными элементами `URLQueryItem`.
    public func addingQueryItemsForArray<T: CustomStringConvertible>(
        _ array: [T]?,
        key: String
    ) -> Array<Element> {
        guard let array = array else {
            return self
        }
        return self.addToTail(array.map({ URLQueryItem(name: key, value: $0.description) }))
    }
    
    /// Добавляет элементы, преобразованные из последовательности, в массив `URLQueryItem`.
    /// - Parameters:
    ///   - values: Последовательность, которая будет преобразована.
    ///   - name: Функция для генерации имени из элементов последовательности.
    ///   - value: Функция для генерации значения из элементов последовательности.
    /// - Returns: Массив с добавленными элементами `URLQueryItem`, преобразованными из последовательности.
    public func addingTransformedQueryItems<T: Sequence>(
        values: T,
        name: (T.Element) -> String,
        value: (T.Element) -> String
    ) -> Array<Element> {
        let newQueryItems: [URLQueryItem] = values.map({ URLQueryItem(name: name($0), value: value($0)) })
        return self.addToTail(newQueryItems)
    }
    
    /// Преобразует массив `URLQueryItem` в строку, закодированную в формате формы.
    /// - Returns: Строка, закодированная в формате формы.
    public func toFormEncodedString() -> String {
        return enumerated().reduce(.empty) { partialResult, value in
            guard let element = value.element.value else {
                return partialResult
            }
            
            return partialResult
                .addToTail(value.element.name)
                .addToTail("=")
                .addToTail(element)
                .addToTail {
                    (value.offset == count.subtraction(1))
                        .getIf(
                            true: .value(.empty),
                            false: .value("&"))
                }
        }
    }
}
