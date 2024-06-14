//
//  ClosedRangeExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 2/6/24.
//

import Foundation

extension ClosedRange {
    /**
     Returns a value within the allowed range.

     - Parameter value: The value to be checked against the available range.
     - Returns: The bounded value within the range; otherwise, returns the appropriate `lowerBound` or `upperBound` values.
     */
    public func getBoundedValue(initial value: Bound) -> Bound {
        let maxValue: Bound = (value > upperBound)
            .getIf(
                true: .value(upperBound),
                false: .value(value)
            )
        return (maxValue < lowerBound)
            .getIf(
                true: .value(lowerBound),
                false: .value(maxValue))
    }
}

