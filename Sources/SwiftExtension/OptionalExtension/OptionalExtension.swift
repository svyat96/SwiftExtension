//
//  OptionalExtension.swift
//  
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import Foundation

extension Optional where Wrapped: NonOptionalProtocol {
	public func nonOptional(
		_ defaultValue: Wrapped = Wrapped.defaultValue
	) -> Wrapped {
		switch self {
		case .none:
			return defaultValue
		case .some(let wrapped):
			return wrapped
		}
	}
}
