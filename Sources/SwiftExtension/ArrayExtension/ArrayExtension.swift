//
//  ArrayExtension.swift
//
//
//  Created by Svyatoslav Sporykhin on 3/20/22.
//

import Foundation

extension Array {
    /**
     Safely accesses the element at the specified index.

     - Parameter index: The index of the element to access.
     - Returns: The element at the specified index if it exists, otherwise `nil`.
     */
    public subscript(safe index: Int) -> Element? {
        return (count > index).and(index >= 0)
            .getIf(true: .func({self[index]}))
    }

    /**
     Removes all elements at the specified sorted indices.

     - Parameter indexes: An array of sorted indices to remove.
     - Returns: A new array with the elements at the specified indices removed.
     */
    public func removeAll(sorted indexes: [Int]) -> Self {
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

    /**
     Removes all elements at the specified unsorted indices.

     - Parameter indexes: An array of unsorted indices to remove.
     - Returns: A new array with the elements at the specified indices removed.
     */
    public func removeAll(nonSorted indexes: [Int]) -> Self {
        let sorted = indexes.sorted()
        return removeAll(sorted: sorted)
    }

    /**
     Safely accesses the index of the first element.

     - Returns: The index of the first element if it exists, otherwise `nil`.
     */
    public var safeStartIndex: Int? {
        return (count == 0).getIf(false: .value(0))
    }

    /**
     Safely accesses the index of the last element.

     - Returns: The index of the last element if it exists, otherwise `nil`.
     */
    public var safeEndIndex: Int? {
        let index: Int = count.subtraction(1)
        return (index < 0).getIf(false: .value(index))
    }
}

//MARK: - addToTail
extension Array {
    /**
     Adds the specified array to the end of the current array.

     - Parameter values: The array to append.
     - Returns: A new array that is the result of appending `values` to the current array.
     */
    public func addToTail(_ values: Self) -> Self {
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

