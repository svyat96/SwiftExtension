//
//  SubtractionExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 4/24/22.
//

import Foundation

extension BinaryFloatingPoint {
    /**
     Subtracts the given integer value from the current value.

     - Parameter value: The integer value to subtract.
     - Returns: The result of subtracting `value` from the current value.
     */
    public func subtraction<T: BinaryInteger>(_ value: T) -> Self {
        return self.subtraction(Self(value))
    }

    /**
     Subtracts the given floating-point value from the current value.

     - Parameter value: The floating-point value to subtract.
     - Returns: The result of subtracting `value` from the current value.
     */
    public func subtraction(_ value: Self) -> Self {
        return self - value
    }

    /**
     Subtracts the given floating-point value from the current value.

     - Parameter value: The floating-point value to subtract.
     - Returns: The result of subtracting `value` from the current value.
     */
    public func subtraction<T: BinaryFloatingPoint>(_ value: T) -> Self {
        return self.subtraction(Self(value))
    }
}

extension BinaryInteger {
    /**
     Subtracts the given integer value from the current value.

     - Parameter value: The integer value to subtract.
     - Returns: The result of subtracting `value` from the current value.
     */
    public func subtraction<T: BinaryInteger>(_ value: T) -> Self {
        return self.subtraction(Self(value))
    }

    /**
     Subtracts the given integer value from the current value.

     - Parameter value: The integer value to subtract.
     - Returns: The result of subtracting `value` from the current value.
     */
    public func subtraction(_ value: Self) -> Self {
        return self - value
    }

    /**
     Subtracts the given floating-point value from the current value.

     - Parameter value: The floating-point value to subtract.
     - Returns: The result of subtracting `value` from the current value.
     */
    public func subtraction<T: BinaryFloatingPoint>(_ value: T) -> Self {
        return self.subtraction(Self(value))
    }

    /**
     Converts the current integer value to the specified floating-point type and subtracts the given floating-point value.

     - Parameter value: The floating-point value to subtract.
     - Returns: The result of converting the current value to the floating-point type and subtracting `value`.
     */
    public func subtractionTo<T: BinaryFloatingPoint>(_ value: T) -> T {
        return T(self).subtraction(value)
    }
}
