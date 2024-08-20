//
//  Ternary.swift
//
//
//  Created by Svyatoslav Sporykhin on 5/17/22.
//

import Foundation

/**
 An enumeration representing an abstract value.
 
 - value: A direct value of type `T`.
 - `func`: A closure that returns a value of type `T`.
 */
public enum TernaryEnum<T: Any> {
    case value(T)
    case `func`(() -> T)
    
    /**
     The resulting value based on the enumeration case.
     
     - Returns: The actual value of type `T`.
     */
    var result: T {
        switch self {
        case .value(let value):
            return value
        case .func(let funcValue):
            return funcValue()
        }
    }
}

/**
 An enumeration representing abstract ternary logic.
 */
public enum Ternary {
    /**
     Readable ternary logic.
     
     - Parameters:
       - `if`: The condition to evaluate.
       - true: The completion to execute if the condition is true.
       - false: The completion to execute if the condition is false.
     - Returns: The result of the true or false completion based on the condition.
     */
    static internal func get<T: Any>(
        if: TernaryEnum<Bool>,
        true: TernaryEnum<T>,
        false: TernaryEnum<T>
    ) -> T {
        return `if`.result ? `true`.result : `false`.result
    }
}
