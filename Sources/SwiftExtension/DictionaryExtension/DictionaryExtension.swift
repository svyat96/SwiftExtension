//
//  DictionaryExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 4/24/22.
//

import Foundation

extension Dictionary {
    /**
     Устанавливает значение в словаре, возвращая новый словарь с обновленным значением.
     
     - Parameters:
     - key: Ключ, по которому необходимо установить значение.
     - value: Значение, которое нужно установить.
     - Returns: Новый словарь с обновленным значением.
     */
    public func withUpdatedValue(
        key: Key,
        _ value: Value
    ) -> Dictionary<Key, Value> {
        var values = self
        values[key] = value
        return values
    }
}

extension Dictionary: DefaultInit {}
extension Dictionary: NonEmptyProtocol {}
