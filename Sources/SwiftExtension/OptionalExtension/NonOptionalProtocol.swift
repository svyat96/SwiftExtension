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
	public static var defaultValue: Float = 0.0
}

extension Double: NonOptionalProtocol {
	public static var defaultValue: Double = 0.0
}

extension Int: NonOptionalProtocol {
	public static var defaultValue: Int = 0
}
