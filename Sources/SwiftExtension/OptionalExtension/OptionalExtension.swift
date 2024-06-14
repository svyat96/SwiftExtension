//
//  OptionalExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 3/20/22.
//

import Foundation

extension Optional where Wrapped: NonOptionalProtocol {
    /**
     Returns the wrapped value if it exists, otherwise returns the default value.

     - Parameter defaultValue: The default value to return if the wrapped value is `nil`.
     - Returns: The wrapped value or the default value.
     */
    public func nonOptional(_ defaultValue: Wrapped = Wrapped.defaultValue) -> Wrapped {
        return self ?? defaultValue
    }
}

extension Optional: NonOptionalProtocol {
    /**
     The default value for `Optional`, which is `nil`.
     */
    public static var defaultValue: Optional<Wrapped> {
        nil
    }
}

extension Optional {
    /**
     Returns the wrapped value if it exists, otherwise returns the specified default value.

     - Parameter defaultValue: The default value to return if the wrapped value is `nil`.
     - Returns: The wrapped value or the default value.
     */
    public func nonOptional(_ defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }

    /**
     Returns the wrapped value if it exists, otherwise returns the specified optional value.

     - Parameter optionalValue: The optional value to return if the wrapped value is `nil`.
     - Returns: The wrapped value or the optional value.
     */
    public func orOptional(_ optionalValue: Self) -> Self {
        return self ?? optionalValue
    }
}
