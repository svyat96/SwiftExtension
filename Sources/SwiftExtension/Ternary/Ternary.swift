//
//  File.swift
//  
//
//  Created by Святослав Спорыхин on 5/17/22.
//

import Foundation


/// Abstract value
/// - case value:(T)
/// - case func: (() -> T)
/// - case pipelineTernary: (TernaryEnum<T>)
/// - var result: return actual case
indirect public enum TernaryEnum<T: Any> {
	case value(T)
	case `func`(() -> T)
	case pipelineTernary(TernaryEnum<T>)
	
	public var result: T {
		switch self {
		case .value(let value):
			return value
		case .func(let funcValue):
			return funcValue()
		case .pipelineTernary(let pipelineFuncValue):
			return pipelineFuncValue.result
		}
	}
}
//Abstract ternary logic
public enum Ternary {
	/// Readable ternary
	/// - Parameter if: Condition
	/// - Parameter true: True completion
	/// - Parameter false: False completion
	/// - Returns: Actual completion
	static public func get<T: Any>(
		if: TernaryEnum<Bool>,
		true: TernaryEnum<T>,
		false: TernaryEnum<T>
	) -> T {
		return `if`.result ? `true`.result : `false`.result
	}
}
