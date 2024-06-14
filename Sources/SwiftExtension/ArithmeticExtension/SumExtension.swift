//
//  SumExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 3/30/22.
//

import Foundation

//MARK: - Sum
extension BinaryFloatingPoint {
    /**
     Adds the given integer value to the current value.

     - Parameter value: The integer value to add.
     - Returns: The result of adding `value` to the current value.
     */
    public func sum<T: BinaryInteger>(_ value: T) -> Self {
        return self.sum(Self(value))
    }

    /**
     Adds the given floating-point value to the current value.

     - Parameter value: The floating-point value to add.
     - Returns: The result of adding `value` to the current value.
     */
    public func sum(_ value: Self) -> Self {
        return self + value
    }

    /**
     Adds the given floating-point value to the current value.

     - Parameter value: The floating-point value to add.
     - Returns: The result of adding `value` to the current value.
     */
    public func sum<T: BinaryFloatingPoint>(_ value: T) -> Self {
        return self.sum(Self(value))
    }
}

extension BinaryInteger {
    /**
     Adds the given integer value to the current value.

     - Parameter value: The integer value to add.
     - Returns: The result of adding `value` to the current value.
     */
    public func sum<T: BinaryInteger>(_ value: T) -> Self {
        return self.sum(Self(value))
    }

    /**
     Adds the given integer value to the current value.

     - Parameter value: The integer value to add.
     - Returns: The result of adding `value` to the current value.
     */
    public func sum(_ value: Self) -> Self {
        return self + value
    }

    /**
     Adds the given floating-point value to the current value.

     - Parameter value: The floating-point value to add.
     - Returns: The result of adding `value` to the current value.
     */
    public func sum<T: BinaryFloatingPoint>(_ value: T) -> Self {
        return self.sum(Self(value))
    }

    /**
     Converts the current integer value to the specified floating-point type and adds the given floating-point value.

     - Parameter value: The floating-point value to add.
     - Returns: The result of converting the current value to the floating-point type and adding `value`.
     */
    public func sumTo<T: BinaryFloatingPoint>(_ value: T) -> T {
        return T(self).sum(value)
    }
}
