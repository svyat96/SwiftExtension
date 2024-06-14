//
//  BoolExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 8/7/22.
//

import Foundation

extension Bool {
    /**
     Checks if the value is false.

     - Returns: `true` if the value is false, otherwise `false`.
     */
    public var isFalse: Bool { self == false }

    /**
     Logical AND operation.

     - Parameter value: The value to perform the AND operation with.
     - Returns: The result of `self && value`.
     */
    public func and(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
        return try self && value()
    }

    /**
     Logical OR operation.

     - Parameter value: The value to perform the OR operation with.
     - Returns: The result of `self || value`.
     */
    public func or(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
        return try self || value()
    }

    /**
     Logical XOR operation.

     - Parameter value: The value to perform the XOR operation with.
     - Returns: The result of `self && (value != self)`.
     */
    public func xor(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
        return try self && (value() != self)
    }

    /**
     Converts the boolean value to an integer.

     - Parameters:
       - trueValue: The value to return if the boolean is true. Default is 1.
       - falseValue: The value to return if the boolean is false. Default is 0.
     - Returns: `trueValue` if the boolean is true, otherwise `falseValue`.
     */
    public func toInt<T: BinaryInteger>(
        trueValue: T = 1,
        falseValue: T = 0
    ) -> T {
        return self.getIf(
            true: .value(trueValue),
            false: .value(falseValue))
    }

    /**
     Converts the boolean value to a floating-point number.

     - Parameters:
       - trueValue: The value to return if the boolean is true. Default is 1.0.
       - falseValue: The value to return if the boolean is false. Default is 0.0.
     - Returns: `trueValue` if the boolean is true, otherwise `falseValue`.
     */
    public func toFloat<T: BinaryFloatingPoint>(
        trueValue: T = 1.0,
        falseValue: T = 0.0
    ) -> T {
        return self.getIf(
            true: .value(trueValue),
            false: .value(falseValue))
    }

    /**
     Returns a value based on the boolean condition.

     - Parameters:
       - true: The value to return if the boolean is true.
       - false: The value to return if the boolean is false.
     - Returns: The value corresponding to the boolean condition.
     */
    public func getIf<T: Any>(
        true: TernaryEnum<T>,
        false: TernaryEnum<T>
    ) -> T {
        return Ternary.get(
            if: .value(self),
            true: `true`,
            false: `false`)
    }

    /**
     Returns an optional value based on the boolean condition.

     - Parameters:
       - true: The value to return if the boolean is true. Default is `nil`.
       - false: The value to return if the boolean is false. Default is `nil`.
     - Returns: The optional value corresponding to the boolean condition.
     */
    public func getIf<T: Any>(
        true: TernaryEnum<T?> = .value(nil),
        false: TernaryEnum<T?> = .value(nil)
    ) -> T? {
        return Ternary.get(
            if: .value(self),
            true: `true`,
            false: `false`)
    }
}

