//
//  NonOptionalProtocol.swift
//
//
//  Created by Svyatoslav Sporykhin on 3/20/22.
//

import Foundation

/**
 A protocol indicating that a type has a default non-optional value.
 */
public protocol NonOptionalProtocol {
    /**
     The default value for the conforming type.
     */
    static var defaultValue: Self { get }
}

extension Float: NonOptionalProtocol {
    /**
     The default value for `Float`, which is `0.0`.
     */
    public static let defaultValue: Float = 0.0
}

extension Double: NonOptionalProtocol {
    /**
     The default value for `Double`, which is `0.0`.
     */
    public static let defaultValue: Double = 0.0
}

extension Int: NonOptionalProtocol {
    /**
     The default value for `Int`, which is `0`.
     */
    public static let defaultValue: Int = 0
}

extension String: NonOptionalProtocol {
    /**
     The default value for `String`, which is an empty string.
     */
    public static let defaultValue: String = .empty
}
