//
//  NumericExtension.swift
//  
//
//  Created by Святослав Спорыхин on 8/17/22.
//

import Foundation

extension BinaryFloatingPoint {
	public func toBinaryInteger<T: BinaryInteger>() -> T {
		return T(self)
	}
}

extension BinaryInteger {
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
