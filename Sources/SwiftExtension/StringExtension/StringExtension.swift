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

extension String: NonOptionalProtocol {
	static public let defaultValue: String = ""
}
