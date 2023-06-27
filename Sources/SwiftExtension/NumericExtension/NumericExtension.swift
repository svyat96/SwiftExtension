//
//  NumericExtension.swift
//  
//
//  Created by Святослав Спорыхин on 8/17/22.
//

import UIKit

extension BinaryFloatingPoint {
	/// Преобразует в целое число
	/// - Returns: Тип целого числа
	public func toBinaryInteger<T: BinaryInteger>() -> T {
		return T(self)
	}
}

extension Int {
	/// Создаем IndexPath
	/// - Parameter section: Номер секции
	/// - Returns: .init(row: self, section: section)
	public func toIndexPath(section: Int) -> IndexPath {
		return .init(row: self, section: section)
	}
	
	/// Создаем IndexPath
	/// - Parameter row: Номер ячейки
	/// - Returns: row.getIndexPath(section: self)
	public func toIndexPath(row: Int) -> IndexPath {
		return row.toIndexPath(section: self)
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
