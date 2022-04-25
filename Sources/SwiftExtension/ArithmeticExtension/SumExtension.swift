//
//  SumExtension.swift
//  
//
//  Created by Святослав Спорыхин on 3/30/22.
//

import Foundation

//MARK: - Sum
extension BinaryFloatingPoint {
	/// - Returns: self + Self(value)
	public func sum<T: BinaryInteger>(_ value: T) -> Self {
		return self.sum(Self(value))
	}
	
	/// - Returns: self + value
	public func sum(_ value: Self) -> Self {
		return self + value
	}

	/// - Returns: self + Self(value)
	public func sum<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.sum(Self(value))
	}
}

extension BinaryInteger {
	/// - Returns: self + Self(value)
	public func sum<T: BinaryInteger>(_ value: T) -> Self {
		return self.sum(Self(value))
	}
	
	/// - Returns: self + value
	public func sum(_ value: Self) -> Self {
		return self + value
	}

	/// - Returns: self + Self(value)
	public func sum<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.sum(Self(value))
	}
}
