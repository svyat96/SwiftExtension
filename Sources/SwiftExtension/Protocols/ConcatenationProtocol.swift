//
//  ConcatenationProtocol.swift
//  
//
//  Created by Святослав Спорыхин on 7/18/23.
//

import Foundation

public protocol ConcatenationProtocol {
	func addToTail(
		_ values: Self
	) -> Array<Self>
}

extension BinaryFloatingPoint where Self: ConcatenationProtocol {
	public func addToTail(
		_ value: Self
	) -> Array<Self> {
		return [self, value]
	}
}

extension BinaryInteger where Self: ConcatenationProtocol {
	public func addToTail(
		_ value: Self
	) -> Array<Self> {
		return [self, value]
	}
}

extension Int: ConcatenationProtocol {}

extension Float: ConcatenationProtocol {}
extension CGFloat: ConcatenationProtocol {}
extension Double: ConcatenationProtocol {}
