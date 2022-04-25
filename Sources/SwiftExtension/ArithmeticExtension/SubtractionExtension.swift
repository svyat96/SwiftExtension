//
//  SubtractionExtension.swift
//  
//
//  Created by Святослав Спорыхин on 4/24/22.
//

import Foundation

extension BinaryFloatingPoint {
	/// - Returns: self - Self(value)
	public func subtraction<T: BinaryInteger>(_ value: T) -> Self {
		return self.subtraction(Self(value))
	}
	
	/// - Returns: self - value
	public func subtraction(_ value: Self) -> Self {
		return self - value
	}

	/// - Returns: self - Self(value)
	public func subtraction<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.subtraction(Self(value))
	}
}

extension BinaryInteger {
	/// - Returns: self - Self(value)
	public func subtraction<T: BinaryInteger>(_ value: T) -> Self {
		return self.subtraction(Self(value))
	}
	
	/// - Returns: self - value
	public func subtraction(_ value: Self) -> Self {
		return self - value
	}

	/// - Returns: self - Self(value)
	public func subtraction<T: BinaryFloatingPoint>(_ value: T) -> Self {
		return self.subtraction(Self(value))
	}
	
	/// - Returns: T(self) - value
	public func subtractionTo<T: BinaryFloatingPoint>(_ value: T) -> T {
		return T(self).subtraction(value)
	}
}
