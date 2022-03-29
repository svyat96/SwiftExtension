//
//  OptionalExtension.swift
//  
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import Foundation

extension Optional where Wrapped: NonOptionalProtocol {
	
	/// Get some value or defaultValue
	/// - Parameter defaultValue: NonOptionalProtocol.defaultValue
	/// - Returns: some ?? defaultValue
	public func nonOptional(
		_ defaultValue: Wrapped = Wrapped.defaultValue
	) -> Wrapped {
		return self ?? defaultValue
	}
}

extension Optional {
	/// Get some value or defaultValue
	public func nonOptional(
		_ defaultValue: Wrapped
	) -> Wrapped {
		return self ?? defaultValue
	}
}
