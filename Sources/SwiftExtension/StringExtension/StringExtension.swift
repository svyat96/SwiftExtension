//
//  StringExtension.swift
//  
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import Foundation

extension String {
	public static let empty = ""
	public static let space = " "
	
	public func add(
		_ value: CustomStringConvertible
	) -> String {
		return self + value.description
	}
	
	public func add(
		_ value: CustomDescription
	) -> String {
		return self + value.customDescription
	}
}

public protocol NonOptionalProtocol {
	static var defaultValue: Self { get }
}

extension Optional where Wrapped: NonOptionalProtocol {
	public func nonOptional(
		_ defaultValue: Wrapped = Wrapped.defaultValue
	) -> Wrapped {
		switch self {
		case .none:
			return defaultValue
		case .some(let wrapped):
			return wrapped
		}
	}
}

extension String: NonOptionalProtocol {
	static public let defaultValue: String = ""
}

extension Array {
	subscript(
		safe index: Int
	) -> Element? {
		return count > index ? self[index] : nil
	}
}
