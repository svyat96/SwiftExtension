//
//  Dictionary + UpdateOrSetDefault.swift
//
//
//  Created by Святослав Спорыхин on 02.09.2024.
//

import Foundation

extension Dictionary where Value: Collection & DefaultInit {
    /**
     Обновляет значение по заданному ключу или устанавливает значение по умолчанию, если ключ отсутствует.
     - Parameters:
     - **key**: Ключ, по которому необходимо найти и обновить значение.
     - **update**: Замыкание, которое обновляет значение.
     - **defaultValue**: Значение по умолчанию, если ключ отсутствует. По умолчанию создается новый экземпляр типа.
     - **Returns**: Словарь с обновленным значением.
     */
    public func updateOrSetDefault(
        key: Key,
        _ value: (Value) -> Value,
        defaultValue: Value = Value.init()
    ) -> Self {
        var values = self
        guard let element = values[key] else {
            values[key] = value(defaultValue)
            return values
        }
        values[key] = value(element)
        return values
    }
}
