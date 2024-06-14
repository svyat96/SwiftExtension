//
//  DictionaryExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 4/24/22.
//

import Foundation

extension Dictionary where Value: RangeReplaceableCollection {
    /**
     Adds a value to an array or creates an array with the value.

     - Parameters:
       - key: The key.
       - value: The element to add.
     */
    mutating public func appendWithCreateIfNeed(key: Key, _ value: Value.Element) {
        switch self[key] {
        case .none:
            self[key] = Value(repeating: value, count: 1)
        case .some:
            self[key]?.append(value)
        }
    }
}

extension Dictionary where Value: Collection & DefaultInit {
    /**
     Adds an element to the dictionary if it does not already exist.

     - Parameters:
       - key: The key where the dictionary value should be found.
       - value: The value to set for the key.
       - defaultValue: The default value if the key does not exist. Defaults to a new instance of the value type.
     - Returns: The modified dictionary.
     */
    public func setValueNon(
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

extension Dictionary {
    /**
     Sets a value in the dictionary without mutation.

     - Parameters:
       - key: The key to set the value for.
       - value: The value to set.
     - Returns: A new dictionary with the updated values.
     */
    public func setValue(key: Key, _ value: Value) -> Dictionary<Key, Value> {
        var values = self
        values[key] = value
        return values
    }
}

/// A marker protocol indicating that types conforming to it can be initialized without arguments.
public protocol DefaultInit {
    init()
}

/// Conforms Dictionary to DefaultInit.
extension Dictionary: DefaultInit {}
