//
//  GetIfProtocol.swift
//
//
//  Created by Svyatoslav Sporykhin on 3/22/24.
//

import Foundation
import Combine

/**
 A protocol that defines methods for conditional value retrieval.
 */
public protocol GetIfProtocol {
    /**
     Retrieves a value based on a boolean condition.

     - Parameters:
       - if: The boolean condition.
       - true: The value to return if the condition is true.
       - false: The value to return if the condition is false.
     - Returns: The value corresponding to the boolean condition.
     */
    func getIf<T: Any>(
        _ if: TernaryEnum<Bool>,
        true: TernaryEnum<T>,
        false: TernaryEnum<T>
    ) -> T

    /**
     Retrieves an optional value based on a boolean condition.

     - Parameters:
       - if: The boolean condition.
       - true: The value to return if the condition is true.
       - false: The value to return if the condition is false.
     - Returns: The optional value corresponding to the boolean condition.
     */
    func getIf<T: Any>(
        _ if: TernaryEnum<Bool>,
        true: TernaryEnum<T?>,
        false: TernaryEnum<T?>
    ) -> T?

    /**
     Retrieves a value based on a closure condition.

     - Parameters:
       - if: A closure that returns a boolean condition.
       - true: The value to return if the condition is true.
       - false: The value to return if the condition is false.
     - Returns: The value corresponding to the closure condition.
     */
    func getIf<T: Any>(
        _ if: (Self) -> Bool,
        true: TernaryEnum<T>,
        false: TernaryEnum<T>
    ) -> T

    /**
     Retrieves an optional value based on a closure condition.

     - Parameters:
       - if: A closure that returns a boolean condition.
       - true: The value to return if the condition is true.
       - false: The value to return if the condition is false.
     - Returns: The optional value corresponding to the closure condition.
     */
    func getIf<T: Any>(
        _ if: (Self) -> Bool,
        true: TernaryEnum<T?>,
        false: TernaryEnum<T?>
    ) -> T?
}

extension GetIfProtocol {
    public func getIf<T: Any>(
        _ if: TernaryEnum<Bool>,
        true: TernaryEnum<T>,
        false: TernaryEnum<T>
    ) -> T {
        return `if`.result.getIf(true: `true`, false: `false`)
    }

    public func getIf<T: Any>(
        _ if: TernaryEnum<Bool>,
        true: TernaryEnum<T?> = .value(nil),
        false: TernaryEnum<T?> = .value(nil)
    ) -> T? {
        return `if`.result.getIf(true: `true`, false: `false`)
    }

    public func getIf<T: Any>(
        _ if: (Self) -> Bool,
        true: TernaryEnum<T>,
        false: TernaryEnum<T>
    ) -> T {
        return `if`(self).getIf(true: `true`, false: `false`)
    }

    public func getIf<T: Any>(
        _ if: (Self) -> Bool,
        true: TernaryEnum<T?> = .value(nil),
        false: TernaryEnum<T?> = .value(nil)
    ) -> T? {
        return `if`(self).getIf(true: `true`, false: `false`)
    }
}

extension Double: GetIfProtocol {}
extension CGFloat: GetIfProtocol {}
extension Float: GetIfProtocol {}

extension Int: GetIfProtocol {}
extension UInt: GetIfProtocol {}

extension String: GetIfProtocol {}
extension Character: GetIfProtocol {}

extension Range: GetIfProtocol {}
extension ClosedRange: GetIfProtocol {}

extension Array: GetIfProtocol {}
extension Dictionary: GetIfProtocol {}
extension Set: GetIfProtocol {}

