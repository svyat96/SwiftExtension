//
//  MultiplicationExtension.swift
//  
//
//  Created by Святослав Спорыхин on 4/24/22.
//

import Foundation

extension BinaryFloatingPoint {
	/// - Returns: self * Self(value)
	public func multiplication<T: BinaryInteger>(_ value: T) -> Self {
		return self.multiplication(Self(value))
	}
	
	/// - Returns: self * value
	public func multiplication(_ value: Self) -> Self {
		return self * value
	}

	/// - Returns: self * Self(value)
	public func multiplication<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.multiplication(Self(value))
	}
}

extension BinaryInteger {
	/// - Returns: self * Self(value)
	public func multiplication<T: BinaryInteger>(_ value: T) -> Self {
		return self.multiplication(Self(value))
	}
	
	/// - Returns: self * value
	public func multiplication(_ value: Self) -> Self {
		return self * value
	}

	/// - Returns: self * Self(value)
	public func multiplication<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.multiplication(Self(value))
	}
	
	/// - Returns: T(self) * value
	public func multiplicationTo<T: BinaryFloatingPoint>(_ value: T) -> T {
		return T(self).multiplication(value)
	}
}

extension String {
	/// - Returns: self * value
	public func multiplication(_ value: Int) -> String {
		return Self.init(repeating: self, count: value)
	}
}

extension Character {
	/// - Returns: self * value
	public func multiplication(_ value: Int) -> String {
		return description.multiplication(value)
	}
}
