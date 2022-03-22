//
//  NonOptionalProtocol.swift
//  
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import Foundation

public protocol NonOptionalProtocol {
	static var defaultValue: Self { get }
}

extension Float: NonOptionalProtocol {
	// = 0.0
	public static var defaultValue: Float = 0.0
}

extension Double: NonOptionalProtocol {
	// = 0.0
	public static var defaultValue: Double = 0.0
}

extension Int: NonOptionalProtocol {
	// = 0
	public static var defaultValue: Int = 0
}

extension String: NonOptionalProtocol {
	// = ""
	static public let defaultValue: String = ""
}
