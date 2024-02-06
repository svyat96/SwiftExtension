//
//  ArrayExtension.swift
//  
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import Foundation

extension Array {
	
	public subscript(
		safe index: Int
	) -> Element? {
		return (count > index).and(index >= 0) ? self[index] : nil
	}
	
	public func removeAll(
		sorted indexes: [Int]
	) -> Self {
		var indexesSequence = indexes.makeIterator()
		var firstIndex = indexesSequence.next()
		
		return enumerated()
			.compactMap { value in
				return (value.offset == firstIndex)
					.getIf(
						true: .func({
							firstIndex = indexesSequence.next()
							return nil
						}),
						false: .value(value.element))
			}
	}
	
	public func removeAll(
		nonSorted indexes: [Int]
	) -> Self {
		let sorted = indexes.sorted()
		return removeAll(sorted: sorted)
	}
    
    ///Безопасное обращение к индексу первого элемента
    public var safeStartIndex: Int? {
        return (count == 0).getIf(false: .value(0))
    }
    
    ///Безопасное обращение к индексу последнего элемента
    public var safeEndIndex: Int? {
        let index: Int = count.subtraction(1)
        return (index < 0).getIf(false: .value(index))
    }
}

//MARK: - addToTail
extension Array {
	/// Добавления массива к хвосту другого массива
	/// - Parameter values: Массив который нужно прибавить
	/// - Returns: возвращает комбинацию массива
	public func addToTail(
		_ values: Self
	) -> Self {
		return values.isEmpty
			.getIf(
				true: .value(self),
				false: .func({
					var result: Self = self
					result.append(contentsOf: values)
					return result
				}))
	}
}

