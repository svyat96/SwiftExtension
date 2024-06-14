//
//  ConcatenationProtocol.swift
//
//
//  Created by Svyatoslav Sporykhin on 7/18/23.
//

import Foundation

/**
 A protocol that defines a method for concatenating values to an array.
 */
public protocol ConcatenationProtocol {
    /**
     Adds the specified values to the end of the array.

     - Parameter values: The values to add.
     - Returns: An array containing the concatenated values.
     */
    func addToTail(_ values: Self) -> Array<Self>
}

extension BinaryFloatingPoint where Self: ConcatenationProtocol {
    /**
     Adds the specified floating-point value to the end of an array.

     - Parameter value: The value to add.
     - Returns: An array containing the current value and the specified value.
     */
    public func addToTail(_ value: Self) -> Array<Self> {
        return [self, value]
    }
}

extension BinaryInteger where Self: ConcatenationProtocol {
    /**
     Adds the specified integer value to the end of an array.

     - Parameter value: The value to add.
     - Returns: An array containing the current value and the specified value.
     */
    public func addToTail(_ value: Self) -> Array<Self> {
        return [self, value]
    }
}

extension Int: ConcatenationProtocol {}

extension Float: ConcatenationProtocol {}
extension CGFloat: ConcatenationProtocol {}
extension Double: ConcatenationProtocol {}
