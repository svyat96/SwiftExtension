//
//  MultiplicationExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 4/24/22.
//

import Foundation

extension BinaryFloatingPoint {
    /**
     Multiplies the current value by the given integer value.

     - Parameter value: The integer value to multiply by.
     - Returns: The result of multiplying the current value by `value`.
     */
    public func multiplication<T: BinaryInteger>(_ value: T) -> Self {
        return self.multiplication(Self(value))
    }

    /**
     Multiplies the current value by the given floating-point value.

     - Parameter value: The floating-point value to multiply by.
     - Returns: The result of multiplying the current value by `value`.
     */
    public func multiplication(_ value: Self) -> Self {
        return self * value
    }

    /**
     Multiplies the current value by the given floating-point value.

     - Parameter value: The floating-point value to multiply by.
     - Returns: The result of multiplying the current value by `value`.
     */
    public func multiplication<T: BinaryFloatingPoint>(_ value: T) -> Self {
        return self.multiplication(Self(value))
    }
}

extension BinaryInteger {
    /**
     Multiplies the current value by the given integer value.

     - Parameter value: The integer value to multiply by.
     - Returns: The result of multiplying the current value by `value`.
     */
    public func multiplication<T: BinaryInteger>(_ value: T) -> Self {
        return self.multiplication(Self(value))
    }

    /**
     Multiplies the current value by the given integer value.

     - Parameter value: The integer value to multiply by.
     - Returns: The result of multiplying the current value by `value`.
     */
    public func multiplication(_ value: Self) -> Self {
        return self * value
    }

    /**
     Multiplies the current value by the given floating-point value.

     - Parameter value: The floating-point value to multiply by.
     - Returns: The result of multiplying the current value by `value`.
     */
    public func multiplication<T: BinaryFloatingPoint>(_ value: T) -> Self {
        return self.multiplication(Self(value))
    }

    /**
     Converts the current integer value to the specified floating-point type and multiplies by the given floating-point value.

     - Parameter value: The floating-point value to multiply by.
     - Returns: The result of converting the current value to the floating-point type and multiplying by `value`.
     */
    public func multiplicationTo<T: BinaryFloatingPoint>(_ value: T) -> T {
        return T(self).multiplication(value)
    }
}

extension String {
    /**
     Repeats the current string the specified number of times.

     - Parameter value: The number of times to repeat the string.
     - Returns: A new string that is the result of repeating the current string `value` times.
     */
    public func multiplication(_ value: Int) -> String {
        return Self.init(repeating: self, count: value)
    }
}

extension Character {
    /**
     Repeats the current character the specified number of times.

     - Parameter value: The number of times to repeat the character.
     - Returns: A new string that is the result of repeating the current character `value` times.
     */
    public func multiplication(_ value: Int) -> String {
        return description.multiplication(value)
    }
}
