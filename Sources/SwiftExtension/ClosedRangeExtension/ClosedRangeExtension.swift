//
//  ClosedRangeExtension.swift
//
//
//  Created by Святослав Спорыхин on 2/6/24.
//

import Foundation

extension ClosedRange {
    
    /// Возвращает значение в рамках допустимого
    /// - Parameter value: Значение сравнивается с доступным диапазоном
    /// - Returns: Получаем значение после проверки по диапазону иначе возращаем допустимые lowerBound/upperBound значения
    public func getBoundedValue(
        initial value: Bound
    ) -> Bound {
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
