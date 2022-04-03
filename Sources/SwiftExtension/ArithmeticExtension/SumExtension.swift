//
//  SumExtension.swift
//  
//
//  Created by Святослав Спорыхин on 3/30/22.
//

import Foundation

//MARK: - Sum
extension BinaryFloatingPoint {
	public func sum<T: BinaryInteger>(_ value: T) -> Self {
		return self.sum(Self(value))
	}
	
	public func sum(_ value: Self) -> Self {
		return self + value
	}

	public func sum<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.sum(Self(value))
	}
}

extension BinaryInteger {
	public func sum<T: BinaryInteger>(_ value: T) -> Self {
		return self.sum(Self(value))
	}
	
	public func sum(_ value: Self) -> Self {
		return self + value
	}

	public func sum<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.sum(Self(value))
	}
}

//MARK: - Substraction
extension BinaryFloatingPoint {
	public func subtraction<T: BinaryInteger>(_ value: T) -> Self {
		return self.subtraction(Self(value))
	}
	
	public func subtraction(_ value: Self) -> Self {
		return self - value
	}

	public func subtraction<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.subtraction(Self(value))
	}
}

extension BinaryInteger {
	public func subtraction<T: BinaryInteger>(_ value: T) -> Self {
		return self.subtraction(Self(value))
	}
	
	public func subtraction(_ value: Self) -> Self {
		return self - value
	}

	public func subtraction<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.subtraction(Self(value))
	}
}

