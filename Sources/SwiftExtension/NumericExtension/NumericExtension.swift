//
//  NumericExtension.swift
//  
//
//  Created by Святослав Спорыхин on 8/17/22.
//

import Foundation

extension BinaryFloatingPoint {
	/// Преобразует в целое число
	/// - Returns: Тип целого числа
	public func toBinaryInteger<T: BinaryInteger>() -> T {
		return T(self)
	}
}

extension BinaryInteger {
	/// Преобразует в дробные числа
	/// - Returns: Тип дробного числа
	public func toBinaryFloatingPoint<T: BinaryFloatingPoint>() -> T {
		return T(self)
	}
}

extension BinaryFloatingPoint {
	public func negative() -> Self {
		return -self
	}
}

extension BinaryInteger where Self: SignedInteger {
	public func negative() -> Self {
		return -self
	}
}

extension BinaryFloatingPoint {
	
	/// Округление дробного числа
	/// - Returns: Округленное дробное число
	public func ceil() -> Self {
		return Darwin.ceil(self)
	}
}
