import XCTest
import Combine
@testable import SwiftExtension

final class DivisionTests: XCTestCase {
    /// Test division of various types
    func testDivision() throws {
        let intValue: Int = 2
        let doubleValue: Double = 30.0
        let floatValue: Float = 24.5
        let cgfloatValue: CGFloat = 5.0
        
        XCTAssertEqual(cgfloatValue.division(intValue), 2.5)
        XCTAssertEqual(doubleValue.division(intValue).division(cgfloatValue), 3.0)
        XCTAssertEqual(intValue.division(doubleValue), 0)
        XCTAssertEqual(intValue.division(cgfloatValue).division(doubleValue), 0)
        XCTAssertEqual(floatValue.division(intValue), 12.25)
        
        XCTAssertEqual(intValue.divisionTo(cgfloatValue), 0.4)
    }
}

final class MultiplicationTests: XCTestCase {
    /// Test multiplication of various types
    func testMultiplication() throws {
        let intValue: Int = 2
        let doubleValue: Double = 30.5
        let floatValue: Float = 24.5
        let cgfloatValue: CGFloat = 5.7
        
        XCTAssertEqual(cgfloatValue.multiplication(intValue), 11.4)
        XCTAssertEqual(doubleValue.multiplication(intValue).multiplication(cgfloatValue), 347.7)
        XCTAssertEqual(intValue.multiplication(doubleValue), 60)
        XCTAssertEqual(intValue.multiplication(cgfloatValue).multiplication(doubleValue), 300)
        XCTAssertEqual(floatValue.multiplication(intValue), 49.0)
        
        XCTAssertEqual(intValue.multiplicationTo(2.7), 5.4)
    }
}

final class SubtractionTests: XCTestCase {
    /// Test subtraction of various types
    func testSubtraction() throws {
        let intValue: Int = 20
        let doubleValue: Double = 30.5
        let floatValue: Float = 24.5
        let cgfloatValue: CGFloat = 5.7
        
        XCTAssertEqual(cgfloatValue.subtraction(intValue), -14.3)
        XCTAssertEqual(doubleValue.subtraction(intValue).subtraction(cgfloatValue), 4.8)
        XCTAssertEqual(intValue.subtraction(doubleValue), -10)
        XCTAssertEqual(intValue.subtraction(cgfloatValue).subtraction(doubleValue), -15)
        XCTAssertEqual(floatValue.subtraction(intValue), 4.5)
        
        XCTAssertEqual(intValue.subtractionTo(cgfloatValue), 14.3)
    }
}

final class ArrayTests: XCTestCase {
    /// Test safe access to array elements
    func testSafeInArray() throws {
        let array: [String] = ["Privet", "Hello"]
        XCTAssertEqual(array[safe: 0], "Privet")
        XCTAssertNil(array[safe: 3])
        XCTAssertNil(array[safe: -1])
        
        let emptyArray: [String] = []
        XCTAssertNil(emptyArray[safe: 20])
    }
    
    /// Test removing specific indices from arrays
    func testRemovedIndexes() {
        let firstValue = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        let indexesNeedRemove = [1, 5, 9, 100]
        let indexesNeedRemoveNonSorted = [100, 5, 1, 9]
        
        let removedValueFirst = firstValue.removeAll(sorted: indexesNeedRemove)
        
        let removedValueSeconde = firstValue.removeAll(nonSorted: indexesNeedRemoveNonSorted)
        
        let successValues = [1, 3, 4, 5, 7, 8, 9]
        
        XCTAssertEqual(removedValueFirst, removedValueSeconde)
        XCTAssertEqual(removedValueFirst, successValues)
        
        let emptyInt: [Int] = []
        
        XCTAssertEqual(emptyInt.removeAll(sorted: indexesNeedRemove), emptyInt)
        XCTAssertEqual(emptyInt.removeAll(nonSorted: indexesNeedRemoveNonSorted), emptyInt)
    }
    
    /// Test index safe access in array
    func testIndexInArray() {
        XCTAssertEqual(["v", "b"].safeStartIndex, 0)
        XCTAssertEqual(["v", "b"].safeEndIndex, 1)
        XCTAssertNil([].safeStartIndex)
        XCTAssertNil([].safeEndIndex)
        
        XCTAssertEqual(["v", "a", "l", "u", "e"].safeStartIndex, 0)
        XCTAssertEqual(["v", "a", "l", "u", "e"].safeEndIndex, 4)
    }
}

final class OptionalTests: XCTestCase {
    /// Test non-optional handling for optionals
    func testNonOptional() throws {
        var nilString: String? = nil
        XCTAssertEqual(nilString.nonOptional(), "")
        XCTAssertEqual(nilString.nonOptional("Hello, world!"), "Hello, world!")
        
        nilString = "Hello!"
        
        XCTAssertEqual(nilString.nonOptional(), "Hello!")
        XCTAssertEqual(nilString.nonOptional("Hello, world!"), "Hello!")
        
        var nilFloat: Float? = nil
        XCTAssertEqual(nilFloat.nonOptional(), 0.0)
        XCTAssertEqual(nilFloat.nonOptional(20.0), 20.0)
        
        nilFloat = 30.0
        XCTAssertEqual(nilFloat.nonOptional(), 30.0)
        XCTAssertEqual(nilFloat.nonOptional(20.0), 30.0)
    }

    /// Test handling optional and default values
    func testAnyOptionalValue() throws {
        var value: String? = "Good bye!"
        var result = value
            .orOptional("Hello!")
            .nonOptional("Privet!")
        XCTAssertEqual(result, value)
        
        value = nil
        
        result = value
            .orOptional("Hello!")
            .nonOptional("Privet!")
        XCTAssertEqual(result, "Hello!")
        
        result = value
            .orOptional(nil)
            .nonOptional("Privet!")
        XCTAssertEqual(result, "Privet!")
    }
}

final class StringTests: XCTestCase {
    /// Test adding values to the head of a string
    func testAddToHeadNCountSymbol() {
        let startValue: String = " world!"
        
        XCTAssertEqual(startValue.addToHead("P", 5), "PPPPP world!")
        XCTAssertEqual("B".addToHead("A", 5).addToHead("C", 5), "CCCCCAAAAAB")
        XCTAssertEqual("".addToHead("A", 5), "AAAAA")
        XCTAssertEqual("Value!".addToHead(.space, 3), "   Value!")
        XCTAssertEqual("".addToHead("", 20), "")
        XCTAssertEqual("pppp".addToHead("", 20), "pppp")
    }
    
    /// Test string multiplication
    func testStringCharacterMultiplication() {
        let charT: Character = "T"
        let charSpace: Character = " "
        
        XCTAssertEqual(charT.multiplication(5), "TTTTT")
        XCTAssertEqual(charSpace.multiplication(5), "     ")
        XCTAssertEqual(charT.multiplication(0), "")
        XCTAssertEqual(charSpace.multiplication(0), "")
        
        XCTAssertEqual("Prv".multiplication(5), "PrvPrvPrvPrvPrv")
        XCTAssertEqual("".multiplication(20), "")
        XCTAssertEqual("Prv".multiplication(0), "")
        XCTAssertEqual("".multiplication(0), "")
    }
    
    /// Test removing spaces from the start of a string
    func testRemoveFirstSpaceSymbol() throws {
        let exampleText = "    Hello!    "
        let successResult = "Hello!    "
        
        let spaceText = "         "
        let resultSpaceText = ""
        XCTAssertEqual(exampleText.textWithoutSpacePrefix(), successResult)
        XCTAssertEqual(successResult.textWithoutSpacePrefix(), successResult)
        XCTAssertEqual(spaceText.textWithoutSpacePrefix(), resultSpaceText)
        XCTAssertEqual(resultSpaceText.textWithoutSpacePrefix(), resultSpaceText)
    }
    
    /// Test capitalizing the first letter of a string
    func testCapitalizingFirstLetter() throws {
        let exampleText = "abbbbb bbbbb"
        let exampleResultText = "Abbbbb bbbbb"
        
        let emptyText = ""
        let emptyResultText = ""
        
        XCTAssertEqual(exampleText.capitalizingFirstLetter(), exampleResultText)
        XCTAssertEqual(emptyText.capitalizingFirstLetter(), emptyResultText)
    }
    
    /// Test functional addition of strings
    func testFunctionalPlusString() throws {
        let exampleText = "bla"
        let exampleResultText = "bla bla"
        let transformText = exampleText.addToTail(.space).addToTail(exampleText)
        
        XCTAssertEqual(transformText, exampleResultText)
    }
    
    /// Test removing specific postfix characters from a string
    func testTextWithoutPostfix() throws {
        var testValue: String = "lalala\"lala\""
        var successResult: String = "lalala\"lala"
        
        XCTAssertEqual(testValue.textWithoutCharacterPostfix(character: "\""), successResult)
        
        testValue = ""
        successResult = ""
        
        XCTAssertEqual(testValue.textWithoutCharacterPostfix(character: "\""), successResult)
        
        testValue = "lalalalala)))))))))"
        successResult = "lalalalala"
        
        XCTAssertEqual(testValue.textWithoutCharacterPostfix(character: ")"), successResult)
        
        testValue = ")))))))))))"
        successResult = ""
        
        XCTAssertEqual(testValue.textWithoutCharacterPostfix(character: ")"), successResult)
    }
}

final class SumTests: XCTestCase {
    /// Test sum of various types
    func testSum() throws {
        let intValue: Int = 20
        let doubleValue: Double = 30.0
        let floatValue: Float = 50.0
        let cgfloatValue: CGFloat = 35.0
        
        XCTAssertEqual(floatValue.sum(doubleValue), 80.0)
        XCTAssertEqual(floatValue.sum(intValue), 70.0)
        
        XCTAssertEqual(doubleValue.sum(intValue).sum(floatValue), 100.0)
        XCTAssertEqual(cgfloatValue.sum(floatValue), 85.0)
        
        XCTAssertEqual(intValue.sumTo(cgfloatValue), 55.0)
    }
}

final class TransformTests: XCTestCase {
    /// Test transforming between integer and floating point types
    func testTransform() {
        XCTAssertEqual(20, 20.0.toBinaryInteger())
        XCTAssertEqual(20.0, 20.toBinaryFloatingPoint())
    }
    
    /// Test negative transformation
    func testNegative() {
        XCTAssertEqual(-20, 20.negative())
        XCTAssertEqual(-30.0, 30.0.negative())
    }
}

final class BooleanTests: XCTestCase {
    /// Test boolean operations
    func testBoolean() {
        let one: Bool = true || false
        let two: Bool = true && true
        let three: Bool = true || true
        let four: Bool = false && false
        
        XCTAssertEqual(one, true.or(false))
        XCTAssertEqual(two, true.and(true))
        XCTAssertNotEqual(three, true.xor(true))
        XCTAssertEqual(four, false.and(false))
    }
    
    /// Test ternary boolean operations
    func testBoolTernary() {
        let val: String = "Str"
        let value: String? = false
            .getIf(
                true: .value(val),
                false: .func({
                    true.getIf(false: .func({
                        val
                    }))
                })
            )
        
        XCTAssertNil(value)
        
        XCTAssertTrue(
            (20 < 30).getIf(
                true: .value(true),
                false: .func({ false })
            )
        )
        
        XCTAssertEqual((20 < 30).getIf(true: .value(10)), 10)
        
        let optionalStrFirst: String? = true.getIf(true: .value("Privet!"))
        let optionalStrSecond: String? = true.getIf(false: .value("Privet!"))
        let optionalStrThree: String? = true.getIf(true: .value("Privet!"), false: .value("Poka!"))
        
        XCTAssertEqual(optionalStrFirst, "Privet!")
        XCTAssertNil(optionalStrSecond)
        XCTAssertEqual(optionalStrThree, "Privet!")
    }
    
    /// Test transforming boolean to number
    func testTransformBoolToNumber() {
        XCTAssertEqual(true.toInt(), 1)
        XCTAssertEqual(false.toInt(), 0)
        XCTAssertEqual(true.toFloat(), 1.0)
        XCTAssertEqual(false.toFloat(), 0.0)
        
        XCTAssertNotEqual(true.toInt(), 0)
        XCTAssertNotEqual(false.toInt(), 1)
        XCTAssertNotEqual(true.toFloat(), 0.0)
        XCTAssertNotEqual(false.toFloat(), 1.0)
        
        XCTAssertEqual(true.toInt(trueValue: 20), 20)
        XCTAssertEqual(false.toInt(trueValue: 20), 0)
        XCTAssertNotEqual(false.toInt(trueValue: 20), 20)
        
        XCTAssertEqual(true.toFloat(trueValue: 20.0), 20.0)
        XCTAssertEqual(false.toFloat(trueValue: 20.0), 0.0)
        XCTAssertNotEqual(false.toFloat(trueValue: 20.0), 20.0)
    }
    
    /// Test boolean false check
    func testIsFalse() {
        XCTAssertEqual(true.isFalse, false)
        XCTAssertEqual(false.isFalse, true)
    }
}

final class DictionaryTests: XCTestCase {
    /// Test appending values to arrays in a dictionary
    func testAppendToArrayInDictionary() throws {
        var dictionary: [String: [Int]] = ["value": [0, 1, 2]]
        
        XCTAssertNil(dictionary["v"])
        
        dictionary.appendWithCreateIfNeed(key: "v", 2)
        
        XCTAssertEqual(dictionary["v"], [2])
        
        dictionary.appendWithCreateIfNeed(key: "v", 3)
        
        XCTAssertEqual(dictionary["v"], [2, 3])
    }
    
    /// Test setting non-existing values in a dictionary
    func testMoreDictionary() {
        let keyPrivet = "Privet"
        let keyPoka = "Poka"
        let values: [String: [Int: Double]]
        values = [:]
            .setValueNon(key: keyPrivet) {
                $0.setValue(key: 300, 29.0)
            }
            .setValueNon(key: keyPoka) {
                $0.setValue(key: 200, 30.0).setValue(key: 400, 75.0)
            }.setValueNon(key: keyPrivet) {
                $0.setValue(key: 402, 89.0)
            }.setValueNon(key: keyPrivet) {$0}
        
        XCTAssertEqual(values, [keyPrivet: [300: 29.0, 402: 89.0], keyPoka: [200: 30.0, 400: 75.0]])
    }
}

final class CGExtensionTests: XCTestCase {
    /// Test CGPoint and CGSize extensions
    func testCGExtension() {
        let testValue: CGFloat = 20.0
        let testValueSecond: CGFloat = 300
        let finalValue: CGRect = testValue
            .add(x: 10.0)
            .add(
                size: testValueSecond
                    .add(height: 30.0))
        
        let succesValue: CGRect = .init(x: 10, y: 20, width: 300, height: 30)
        XCTAssertEqual(finalValue, succesValue)
        
        XCTAssertEqual(succesValue.width.add(height: 40.0), CGSize(width: succesValue.width, height: 40.0))
    }
}

final class ClosedRangeTests: XCTestCase {
    /// Test bounded value retrieval from ClosedRange
    func testClosedRange() {
        XCTAssertEqual((0...0).getBoundedValue(initial: 20), 0)
        XCTAssertEqual((0...10).getBoundedValue(initial: 20), 10)
        XCTAssertEqual((0...30).getBoundedValue(initial: 20), 20)
        XCTAssertEqual((0...10).getBoundedValue(initial: -10), 0)
        XCTAssertEqual((-5...10).getBoundedValue(initial: -10), -5)
        XCTAssertEqual((-15...10).getBoundedValue(initial: -10), -10)
        
        XCTAssert((0.0...0.5).getBoundedValue(initial: 20).isEqual(to: 0.5))
        XCTAssert((0.0...10.0).getBoundedValue(initial: 20).isEqual(to: 10.0))
        XCTAssert((0.0...30.0).getBoundedValue(initial: 20).isEqual(to: 20.0))
        XCTAssert((0.0...10.0).getBoundedValue(initial: -10).isEqual(to: 0.0))
        XCTAssert((-5.0...10.0).getBoundedValue(initial: -10).isEqual(to: -5.0))
        XCTAssert((-15.0...10.0).getBoundedValue(initial: -10).isEqual(to: -10.0))
    }
}

final class TernaryTests: XCTestCase {
    /// Test ternary operations
    func testTernary() throws {
        XCTAssertTrue(
            Ternary.get(
                if: .value(20 < 30),
                  true: .value(true),
                  false: .func({
                      false
                  })
            )
        )
    }
    
    /// Test conditional value retrieval using GetIfProtocol
    func testGetIfProtocol() {
        let str = "BlaBla"
        let value: Double = 0.0
            .sum(0.5)
            .multiplication(3)
            .getIf({$0 > 0.5}, true: .value(0), false: .value(2))
            .getIf(.func({ str == "Bla" }), true: .value(0), false: .value(2))
        
        let valueDict: [String: Int] = ["BlaBla2": 0, "BlaBla3": 1, "BlaBla4": 2]
        
        XCTAssertEqual(valueDict.getIf(
            { $0.first { $0.key == "BlaBla3" } != nil },
            true: .value(["BlaBla3": 1]))
        .nonOptional(["Bla": 2]), ["BlaBla3": 1] )
        
        XCTAssertEqual(valueDict.getIf(
            { $0.first { $0.key == "BlaBla5" } != nil },
            true: .value(["BlaBla3": 1]))
        .nonOptional(["Bla": 2]), ["Bla": 2] )
        
        XCTAssertTrue(
            valueDict.getIf(
                {$0.isEmpty},
                true: .value(20),
                false: .value(30))
            .isEqual(to: 30)
        )
        
        XCTAssertTrue(value.isEqual(to: 2))
    }
    
    /// Test ceiling function for floating point numbers
    func testCeil() {
        XCTAssertEqual(ceil(20.0), 20.0.ceil())
        XCTAssertEqual(ceil(20.3), 20.3.ceil())
        XCTAssertEqual(ceil(-1), -0.2.ceil())
    }
}

