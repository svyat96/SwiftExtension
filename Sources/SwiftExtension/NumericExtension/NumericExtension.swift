//
//  NumericExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 8/17/22.
//

import UIKit

extension BinaryFloatingPoint {
    /**
     Converts to an integer type.

     - Returns: The integer representation of the floating-point value.
     */
    public func toBinaryInteger<T: BinaryInteger>() -> T {
        return T(self)
    }
}

extension Int {
    /**
     Creates an `IndexPath` with the current integer as the row.

     - Parameter section: The section number.
     - Returns: An `IndexPath` with the current integer as the row and the specified section.
     */
    public func toIndexPath(section: Int) -> IndexPath {
        return .init(row: self, section: section)
    }
    
    /**
     Creates an `IndexPath` with the current integer as the section.

     - Parameter row: The row number.
     - Returns: An `IndexPath` with the specified row and the current integer as the section.
     */
    public func toIndexPath(row: Int) -> IndexPath {
        return row.toIndexPath(section: self)
    }
}

extension BinaryInteger {
    /**
     Converts to a floating-point type.

     - Returns: The floating-point representation of the integer value.
     */
    public func toBinaryFloatingPoint<T: BinaryFloatingPoint>() -> T {
        return T(self)
    }
}

extension BinaryFloatingPoint {
    /**
     Returns the negative of the current value.

     - Returns: The negative value.
     */
    public func negative() -> Self {
        return -self
    }
}

extension BinaryInteger where Self: SignedInteger {
    /**
     Returns the negative of the current value.

     - Returns: The negative value.
     */
    public func negative() -> Self {
        return -self
    }
}

extension BinaryFloatingPoint {
    /**
     Rounds the floating-point value up to the nearest whole number.

     - Returns: The smallest integral value that is not less than the current value.
     */
    public func ceil() -> Self {
        return Darwin.ceil(self)
    }
}
