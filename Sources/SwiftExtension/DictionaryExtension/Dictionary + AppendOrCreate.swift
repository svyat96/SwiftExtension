//
//  Dictionary + AppendOrCreate.swift
//
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension Dictionary where Value: RangeReplaceableCollection {
    /**
     Добавляет значение в коллекцию по заданному ключу или создает новую коллекцию с этим значением.
     - Parameters:
     - **key**: Ключ, по которому необходимо добавить значение.
     - **value**: Элемент, который нужно добавить в коллекцию.
     */
    mutating public func appendOrCreate(
        key: Key,
        _ value: Value.Element
    ) {
        switch self[key] {
        case .none:
            self[key] = Value(repeating: value, count: 1)
        case .some:
            self[key]?.append(value)
        }
    }
}
