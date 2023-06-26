//
//  NonOptionalProtocol.swift
//  
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import Foundation

public protocol NonOptionalProtocol {
	/// Значение по умолчанию
	static var defaultValue: Self { get }
}

extension Float: NonOptionalProtocol {
	/// = 0.0
	public static let defaultValue: Float = 0.0
}

extension Double: NonOptionalProtocol {
	/// = 0.0
	public static let defaultValue: Double = 0.0
}

extension Int: NonOptionalProtocol {
	/// = 0
	public static let defaultValue: Int = 0
}

extension String: NonOptionalProtocol {
	/// = ""
	public static let defaultValue: String = .empty
}
