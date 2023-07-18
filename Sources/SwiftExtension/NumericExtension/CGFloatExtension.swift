//
//  CGFloatExtension.swift
//  
//
//  Created by Святослав Спорыхин on 7/18/23.
//

import CoreGraphics

extension CGFloat {
	public func add(
		width: CGFloat
	) -> CGSize {
		return .init(width: width, height: self)
	}
	
	public func add(
		height: CGFloat
	) -> CGSize {
		return .init(width: self, height: height)
	}
	
	public func add(
		y: CGFloat
	) -> CGPoint {
		return .init(x: self, y: y)
	}
	
	public func add(
		x: CGFloat
	) -> CGPoint {
		return .init(x: x, y: self)
	}
}

extension CGPoint {
	public func add(
		size: CGSize
	) -> CGRect {
		return .init(origin: self, size: size)
	}
}

extension CGSize {
	public func add(
		point: CGPoint
	) -> CGRect {
		return .init(origin: point, size: self)
	}
}
