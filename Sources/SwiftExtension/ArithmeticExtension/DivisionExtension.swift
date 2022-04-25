//
//  DivisionExtension.swift
//  
//
//  Created by Святослав Спорыхин on 4/24/22.
//

import Foundation

extension BinaryFloatingPoint {
	/// - Returns: self / Self(value)
	public func division<T: BinaryInteger>(_ value: T) -> Self {
		return self.division(Self(value))
	}
	
	/// - Returns: self / value
	public func division(_ value: Self) -> Self {
		return self / value
	}

	/// - Returns: self / Self(value)
	public func division<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.division(Self(value))
	}
}

extension BinaryInteger {
	
	/// - Returns: self / Self(value)
	public func division<T: BinaryInteger>(_ value: T) -> Self {
		return self.division(Self(value))
	}
	
	/// - Returns: self / value
	public func division(_ value: Self) -> Self {
		return self / value
	}
	
	/// - Returns: self / Self(value)
	public func division<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.division(Self(value))
	}
}
