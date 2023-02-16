//
//  BoolExtension.swift
//  
//
//  Created by Святослав Спорыхин on 8/7/22.
//

import Foundation

extension Bool {
	///И то, и то
	public func and(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
		return try self && value()
	}
	
	///Либо то, либо то и оба сразу
	public func or(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
		return try self || value()
	}
	
	///Либо то, либо то, но не оба сразу
	public func xor(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
		return try self && (value() != self)
	}
	
	
	/// Переводим Bool в целое число
	/// - Returns: true == 1, false == 0
	public func toInt<T: BinaryInteger>() -> T {
		return Ternary
			.get(
				if: .value(self),
				true: .value(1),
				false: .value(0)
			)
	}
	
	
	/// Переводим Bool в дробное значение
	/// - Returns: true == 1.0, false == 0.0
	public func toFloat<T: BinaryFloatingPoint>() -> T {
		return Ternary
			.get(
				if: .value(self),
				true: .value(1.0),
				false: .value(0.0)
			)
	}
}


