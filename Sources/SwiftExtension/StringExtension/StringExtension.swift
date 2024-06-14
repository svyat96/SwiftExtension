//
//  StringExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 3/20/22.
//

import Foundation

extension Character {
    /**
     A space character (`" "`).
     */
    public static let space: Character = " "
}

extension String {
    /**
     An empty string (`""`).
     */
    public static let empty = ""
    
    /**
     A space string (`" "`).
     */
    public static let space = " "
    
    /**
     Returns the text without spaces before the first letter.

     - Returns: The text without leading spaces.
     */
    public func textWithoutSpacePrefix() -> String {
        textWithoutCharacterPrefix(character: .space)
    }
    
    /**
     Returns the text without the specified character before the first letter.

     - Parameter character: The character to remove.
     - Returns: The text without leading characters.
     */
    public func textWithoutCharacterPrefix(character: Character) -> String {
        let firstIndexOptional = firstIndex { char in char != character }
        guard let firstIndex = firstIndexOptional else {
            return .empty
        }
        return String(self[firstIndex...])
    }
    
    /**
     Returns the text without the specified character at the end.

     - Parameter character: The character to remove.
     - Returns: The text without the trailing character.
     */
    public func textWithoutCharacterPostfix(character: Character) -> String {
        reversed()
            .toString()
            .textWithoutCharacterPrefix(character: character)
            .reversed()
            .toString()
    }
    
    /**
     Returns the text with the first letter capitalized if it was lowercase.

     - Returns: The text with the first letter capitalized.
     */
    public func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    /**
     Adds the specified value to the beginning of the string.

     - Parameter value: The value to add.
     - Returns: The new string with the value added to the beginning.
     */
    public func addToHead(_ value: CustomStringConvertible) -> String {
        return addToHead(value.description)
    }
    
    /**
     Adds the specified custom description value to the beginning of the string.

     - Parameter value: The custom description value to add.
     - Returns: The new string with the custom description value added to the beginning.
     */
    public func addToHead(_ value: CustomDescription) -> String {
        return addToHead(value.customDescription)
    }
    
    /**
     Adds the specified value to the end of the string.

     - Parameter value: The value to add.
     - Returns: The new string with the value added to the end.
     */
    public func addToTail(_ value: CustomStringConvertible) -> String {
        return addToTail(value.description)
    }
    
    /**
     Adds the specified custom description value to the end of the string.

     - Parameter value: The custom description value to add.
     - Returns: The new string with the custom description value added to the end.
     */
    public func addToTail(_ value: CustomDescription) -> String {
        return addToTail(value.customDescription)
    }
    
    /**
     Adds the result of the closure to the beginning of the string.

     - Parameter strokeClosure: A closure that returns a string.
     - Returns: The new string with the result of the closure added to the beginning.
     */
    public func addToHead(_ strokeClosure: () -> String) -> String {
        return strokeClosure() + self
    }
    
    /**
     Adds the result of the closure to the end of the string.

     - Parameter strokeClosure: A closure that returns a string.
     - Returns: The new string with the result of the closure added to the end.
     */
    public func addToTail(_ strokeClosure: () -> String) -> String {
        return self + strokeClosure()
    }
    
    /**
     Adds the specified string to the beginning of the string.

     - Parameter stroke: The string to add.
     - Returns: The new string with the specified string added to the beginning.
     */
    public func addToHead(_ stroke: String) -> String {
        return addToHead {
            return stroke
        }
    }
    
    /**
     Adds the specified string to the end of the string.

     - Parameter stroke: The string to add.
     - Returns: The new string with the specified string added to the end.
     */
    public func addToTail(_ stroke: String) -> String {
        return addToTail {
            return stroke
        }
    }
    
    /**
     Adds the specified optional string to the end of the string.

     - Parameter optionalStroke: The optional string to add.
     - Returns: The new string with the optional string added to the end if it exists.
     */
    public func addToTail(_ optionalStroke: String?) -> String {
        guard let optionalStroke = optionalStroke else {
            return self
        }
        return addToTail(optionalStroke)
    }
    
    /**
     Adds the specified optional string to the beginning of the string.

     - Parameter optionalStroke: The optional string to add.
     - Returns: The new string with the optional string added to the beginning if it exists.
     */
    public func addToHead(_ optionalStroke: String?) -> String {
        guard let optionalStroke = optionalStroke else {
            return self
        }
        return addToHead(optionalStroke)
    }
    
    /**
     Converts the string to a `Double`.

     - Returns: The `Double` value represented by the string, or `nil` if the string cannot be converted.
     */
    public func toDouble() -> Double? {
        return Double(self)
    }
    
    /**
     Converts the string to an `Int`.

     - Returns: The `Int` value represented by the string, or `nil` if the string cannot be converted.
     */
    public func toInt() -> Int? {
        return Int(self)
    }
    
    /**
     Adds the specified symbol to the beginning of the string, repeated a given number of times.

     - Parameters:
       - symbol: The symbol to repeat.
       - countSymbol: The number of times to repeat the symbol. Default is 1.
     - Returns: The new string with the repeated symbol added to the beginning.
     */
    public func addToHead(_ symbol: String, _ countSymbol: Int = 1) -> String {
        symbol
            .multiplication(countSymbol)
            .addToTail(self)
    }
}

extension Array where Element == Character {
    /**
     Converts the array of characters to a string.

     - Returns: A string composed of the characters in the array.
     */
    public func toString() -> String {
        return String(self)
    }
}
