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

extension Dictionary where Value: Collection & DefaultInit {
	
	/// Метод добавления элемента к словарю который не сохранен в словаре
	/// - Parameters:
	///   - key: Ключ где искать словарь в который хотим вставить значение
	///   - value: Возвращаем новый словарь по ключу
	///   - defaultValue: Базовые значения если по ключу ничего не найдено
	/// - Returns: Измененый родительский словарь
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
	
	/// Метод вставки без мутации
	/// - Parameters:
	///   - key: Ключ куда вставляем
	///   - value: Значение которое вставляем
	/// - Returns: Новый словарь с значениями
	public func setValue(key: Key, _ value: Value) -> Dictionary<Key, Value> {
		var values = self
		values[key] = value
		return values
	}
}

/// Протокол маркер для подписания типов о том что они имеют инициализацию без аргументов
public protocol DefaultInit {
	init()
}

///Помечаем словарь как объект с базовой инициализацией
extension Dictionary: DefaultInit {}
