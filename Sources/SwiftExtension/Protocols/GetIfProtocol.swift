//
//  GetIfProtocol.swift
//  
//
//  Created by Святослав Спорыхин on 3/22/24.
//

import Foundation
import Combine

public protocol GetIfProtocol {
    func getIf<T: Any>(
        _ if: TernaryEnum<Bool>,
        true: TernaryEnum<T>,
        false: TernaryEnum<T>
    ) -> T
    
    func getIf<T: Any>(
        _ if: TernaryEnum<Bool>,
        true: TernaryEnum<T?>,
        false: TernaryEnum<T?>
    ) -> T?
    
    func getIf<T: Any>(
        _ if: (Self) -> Bool,
        true: TernaryEnum<T>,
        false: TernaryEnum<T>
    ) -> T
    
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
