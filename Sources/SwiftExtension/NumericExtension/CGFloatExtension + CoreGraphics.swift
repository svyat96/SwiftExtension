//
//  CGFloatExtension + CoreGraphics.swift
//
//
//  Created by Svyatoslav Sporykhin on 7/18/23.
//

import CoreGraphics

extension CGFloat {
    /**
     Creates a `CGSize` with the specified width and the current value as the height.

     - Parameter width: The width value.
     - Returns: A `CGSize` with the specified width and the current value as the height.
     */
    public func add(width: CGFloat) -> CGSize {
        return .init(width: width, height: self)
    }

    /**
     Creates a `CGSize` with the specified height and the current value as the width.

     - Parameter height: The height value.
     - Returns: A `CGSize` with the specified height and the current value as the width.
     */
    public func add(height: CGFloat) -> CGSize {
        return .init(width: self, height: height)
    }

    /**
     Creates a `CGPoint` with the specified y value and the current value as the x value.

     - Parameter y: The y value.
     - Returns: A `CGPoint` with the specified y value and the current value as the x value.
     */
    public func add(y: CGFloat) -> CGPoint {
        return .init(x: self, y: y)
    }

    /**
     Creates a `CGPoint` with the specified x value and the current value as the y value.

     - Parameter x: The x value.
     - Returns: A `CGPoint` with the specified x value and the current value as the y value.
     */
    public func add(x: CGFloat) -> CGPoint {
        return .init(x: x, y: self)
    }
}

extension CGPoint {
    /**
     Creates a `CGRect` with the current point as the origin and the specified size.

     - Parameter size: The size value.
     - Returns: A `CGRect` with the current point as the origin and the specified size.
     */
    public func add(size: CGSize) -> CGRect {
        return .init(origin: self, size: size)
    }
}

extension CGSize {
    /**
     Creates a `CGRect` with the specified point as the origin and the current size.

     - Parameter point: The origin point.
     - Returns: A `CGRect` with the specified point as the origin and the current size.
     */
    public func add(point: CGPoint) -> CGRect {
        return .init(origin: point, size: self)
    }
}
