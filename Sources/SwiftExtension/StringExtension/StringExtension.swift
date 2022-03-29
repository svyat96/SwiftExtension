//
//  StringExtension.swift
//  
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import Foundation

extension Character {
	/// = " "
	public static let space: Character = " "
}

extension String {
	/// = ""
	public static let empty = ""
	/// = " "
	public static let space = " "
	
	/// Returns text without spaces before the first letter.
	public func textWithoutSpacePrefix() -> String {
		textWithoutCharacterPrefix(character: .space)
	}
	
	/// Returns the text without the character before the first letter.
	public func textWithoutCharacterPrefix(
		character: Character
	) -> String {
		let firstIndexOptional = firstIndex { char in char != character }
		guard let firstIndex = firstIndexOptional
		else {
			return .empty
		}
		return String(self[firstIndex...])
	}
	
	/// Returns the text with a capital letter of the first word if it was small.
	public func capitalizingFirstLetter() -> String {
		return prefix(1).capitalized + dropFirst()
	}
	
	/// - Parameter value: CustomStringConvertible
	/// - Returns: value.description + self
	public func addToHead(
		_ value: CustomStringConvertible
	) -> String {
		return addToHead(value.description)
	}
	
	/// - Parameter value: CustomDescription
	/// - Returns: value.customDescription + self
	public func addToHead(
		_ value: CustomDescription
	) -> String {
		return addToHead(value.customDescription)
	}
	
	/// - Parameter value: CustomStringConvertible
	/// - Returns: self + value.description
	public func addToTail(
		_ value: CustomStringConvertible
	) -> String {
		return addToTail(value.description)
	}
	
	/// - Parameter value: CustomDescription
	/// - Returns: self + value.customDescription
	public func addToTail(
		_ value: CustomDescription
	) -> String {
		return addToTail(value.customDescription)
	}
	
	/// - Parameter strokeClosure: string configuration
	/// - Returns: strokeClosure + self
	public func addToHead(
		_ strokeClosure: () -> String
	) -> String {
		return strokeClosure() + self
	}
	
	/// - Parameter strokeClosure: string configuration
	/// - Returns: strokeClosure + self
	public func addToTail(
		_ strokeClosure: () -> String
	) -> String {
		return self + strokeClosure()
	}
	
	/// - Parameter stroke: string 
	/// - Returns: stroke + self
	public func addToHead(
		_ stroke: String
	) -> String {
		return addToHead {
			return stroke
		}
	}
	
	/// - Parameter stroke: string
	/// - Returns: self + stroke
	public func addToTail(
		_ stroke: String
	) -> String {
		return addToTail {
			return stroke
		}
	}
	
	/// - Parameter optionalStroke: string?
	/// - Returns: self || self + optionalStroke
	public func addToTail(
		_ optionalStroke: String?
	) -> String {
		guard let optionalStroke = optionalStroke else {
			return self
		}
		return addToTail(optionalStroke)
	}
	
	/// - Parameter optionalStroke: string?
	/// - Returns:  self || optionalStroke + self
	public func addToHead(
		_ optionalStroke: String?
	) -> String {
		guard let optionalStroke = optionalStroke else {
			return self
		}
		return addToHead(optionalStroke)
	}
	
	/// - Returns: Double(self)
	func toDouble() -> Double? {
		return Double(self)
	}
	
	/// - Returns: Int(self)
	func toInt() -> Int? {
		return Int(self)
	}
}
