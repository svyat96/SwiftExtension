//
//  BoolExtension.swift
//  
//
//  Created by Святослав Спорыхин on 8/7/22.
//

import Foundation

extension Bool {
	///И то, и то
	public func and(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
		return try self && value()
	}
	
	///Либо то, либо то и оба сразу
	public func or(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
		return try self || value()
	}
	
	///Либо то, либо то, но не оба сразу
	public func xor(_ value: @autoclosure () throws -> Bool) rethrows -> Bool {
		return try self && (value() != self)
	}
}


