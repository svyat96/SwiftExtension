//
//  DivisionExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 4/24/22.
//

import Foundation

extension BinaryFloatingPoint {
    /**
     Divides the current value by the given integer value.

     - Parameter value: The integer value to divide by.
     - Returns: The result of dividing the current value by `value`.
     */
    public func division<T: BinaryInteger>(
        _ value: T
    ) -> Self {
        return self.division(Self(value))
    }

    /**
     Divides the current value by the given floating-point value.

     - Parameter value: The floating-point value to divide by.
     - Returns: The result of dividing the current value by `value`.
     */
    public func division(
        _ value: Self
    ) -> Self {
        return self / value
    }

    /**
     Divides the current value by the given floating-point value.

     - Parameter value: The floating-point value to divide by.
     - Returns: The result of dividing the current value by `value`.
     */
    public func division<T: BinaryFloatingPoint>(
        _ value: T
    ) -> Self {
        return self.division(Self(value))
    }
}

extension BinaryInteger {
    /**
     Divides the current value by the given integer value.

     - Parameter value: The integer value to divide by.
     - Returns: The result of dividing the current value by `value`.
     */
    public func division<T: BinaryInteger>(
        _ value: T
    ) -> Self {
        return self.division(Self(value))
    }

    /**
     Divides the current value by the given integer value.

     - Parameter value: The integer value to divide by.
     - Returns: The result of dividing the current value by `value`.
     */
    public func division(
        _ value: Self
    ) -> Self {
        return self / value
    }

    /**
     Divides the current value by the given floating-point value.

     - Parameter value: The floating-point value to divide by.
     - Returns: The result of dividing the current value by `value`.
     */
    public func division<T: BinaryFloatingPoint>(
        _ value: T
    ) -> Self {
        return self.division(Self(value))
    }

    /**
     Converts the current integer value to the specified floating-point type and divides by the given floating-point value.

     - Parameter value: The floating-point value to divide by.
     - Returns: The result of converting the current value to the floating-point type and dividing by `value`.
     */
    public func divisionTo<T: BinaryFloatingPoint>(
        _ value: T
    ) -> T {
        return T(self).division(value)
    }
}
