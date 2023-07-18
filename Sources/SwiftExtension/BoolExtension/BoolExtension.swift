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
	/// - Parameters:
	///   - trueValue: По умолчанию 1
	///   - falseValue: По умолчанию 0
	/// - Returns: trueValue || falseValue
	public func toInt<T: BinaryInteger>(
		trueValue: T = 1,
		falseValue: T = 0
	) -> T {
		return self.getIf(
			true: .value(trueValue),
			false: .value(falseValue))
	}
	
	/// Переводим Bool в дробное значение
	/// - Parameters:
	///   - trueValue: По умолчанию 1.0
	///   - falseValue: По умолчанию 0.0
	/// - Returns: trueValue || falseValue
	public func toFloat<T: BinaryFloatingPoint>(
		trueValue: T = 1.0,
		falseValue: T = 0.0
	) -> T {
		return self.getIf(
			true: .value(trueValue),
			false: .value(falseValue))
	}
	
	public func getIf<T>(
		true: TernaryEnum<T>,
		false: TernaryEnum<T>
	) -> T {
		return Ternary.get(
			if: .value(self),
			true: `true`,
			false: `false`)
	}
	
	public func getIf<T>(
		true: TernaryEnum<T>,
		false: TernaryEnum<T> = .value(.defaultValue)
	) -> T where T: NonOptionalProtocol {
		return Ternary.get(
			if: .value(self),
			true: `true`,
			false: `false`)
	}
}


