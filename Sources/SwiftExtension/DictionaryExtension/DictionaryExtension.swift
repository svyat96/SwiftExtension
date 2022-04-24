//
//  DictionaryExtension.swift
//  
//
//  Created by Святослав Спорыхин on 4/24/22.
//

import Foundation

extension Dictionary where Value: RangeReplaceableCollection {
	
	/// Adds a value to an array or creates an array with a value
	/// - Parameters:
	///   - key: Key
	///   - value: Element
	mutating public func appendWithCreateIfNeed(key: Key, _ value: Value.Element) {
		switch self[key] {
		case .none:
			self[key] = Value(repeating: value, count: 1)
		case .some:
			self[key]?.append(value)
		}
	}
}
