import XCTest
import Combine
@testable import SwiftExtension

final class SwiftExtensionTests: XCTestCase {
	func testAdd() throws {
		XCTAssert("20.0" == .empty.addToTail(20.0))
	}
	
	func testNonOptional() throws {
		var nilString: String? = nil
		XCTAssert(nilString.nonOptional() == "")
		XCTAssert(nilString.nonOptional("Hello, world!") == "Hello, world!")
		
		nilString = "Hello!"
		
		XCTAssert(nilString.nonOptional() == "Hello!")
		XCTAssert(nilString.nonOptional("Hello, world!") == "Hello!")
		
		var nilFloat: Float? = nil
		XCTAssert(nilFloat.nonOptional() == 0.0)
		XCTAssert(nilFloat.nonOptional(20.0) == 20.0)
		
		nilFloat = 30.0
		XCTAssert(nilFloat.nonOptional() == 30.0)
		XCTAssert(nilFloat.nonOptional(20.0) == 30.0)
		
		var nilValue: (String, Double)? = nil
		XCTAssert(nilValue.nonOptional(("20.0", 30.0)) == ("20.0", 30.0))
		nilValue = ("20.0", 30.0)
		XCTAssert(nilValue.nonOptional(("30.0", 30.0)) == ("20.0", 30.0))
	}
	
	func testSafeInArray() throws {
		let array: [String] = ["Privet", "Hello"]
		XCTAssert(array[safe: 0] == "Privet")
		XCTAssert(array[safe: 3] == nil)
		
		let emptyArray: [String] = []
		XCTAssert(emptyArray[safe: 20] == nil)
	}
	
	func testRemoveFirstSpaceSymbol() throws {
		let exampleText = "    Hello!    "
		let successResult = "Hello!    "
		
		let spaceText = "         "
		let resultSpaceText = ""
		XCTAssert(exampleText.textWithoutSpacePrefix() == successResult)
		XCTAssert(successResult.textWithoutSpacePrefix() == successResult)
		XCTAssert(spaceText.textWithoutSpacePrefix() == resultSpaceText)
		XCTAssert(resultSpaceText.textWithoutSpacePrefix() == resultSpaceText)
	}
	
	func testCapitalizingFirstLetter() throws {
		let exampleText = "abbbbb bbbbb"
		let exampleResultText = "Abbbbb bbbbb"
		
		let emptyText = ""
		let emptyResultText = ""
		
		XCTAssert(exampleText.capitalizingFirstLetter() == exampleResultText)
		XCTAssert(emptyText.capitalizingFirstLetter() == emptyResultText)
	}
	
	func testFunctionalPlusString() throws {
		let exampleText = "bla"
		let exampleResultText = "bla bla"
		let transformText = exampleText.addToTail(.space).addToTail(exampleText)
		
		XCTAssert(transformText == exampleResultText)
	}
	
	var testOnlyMainCombineCancellable: AnyCancellable?
	var testOnlyGlobalCombineCancellable: AnyCancellable?
	
	var timer: Timer?
	@Published var testCombineValue: Int = 0
	
	func testCombine() throws {
		let completedExpectation = expectation(description: "Completed")
		testOnlyMainCombineCancellable = $testCombineValue
			.autoReceiveInMainQueue()
			.sink { value in
				print("Only main run!")
				XCTAssert(Thread.isMainThread, "Only main!")
				print("Only main complete!")
			}
		
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
			DispatchQueue.global(qos: .background).async { [weak self] in
				self?.testOnlyGlobalCombineCancellable = self?.$testCombineValue
					.sink { value in
						print("Only background run!")
						XCTAssert(Thread.isMainThread == false, "Only background!")
						print("Only background complete!")
					}
				self?.testCombineValue = 10
				completedExpectation.fulfill()
			}
		}
		waitForExpectations(timeout: 5, handler: nil)
	}
	
	func testTextWithoutPostfix() throws {
		var testValue: String = "lalala\"lala\""
		var successResult: String = "lalala\"lala"
		
		XCTAssert(testValue.textWithoutCharacterPostfix(character: "\"") == successResult)
		
		testValue = ""
		successResult = ""
		
		XCTAssert(testValue.textWithoutCharacterPostfix(character: "\"") == successResult)
		
		testValue = "lalalalala)))))))))"
		successResult = "lalalalala"
		
		XCTAssert(testValue.textWithoutCharacterPostfix(character: ")") == successResult)
		
		testValue = ")))))))))))"
		successResult = ""
		
		XCTAssert(testValue.textWithoutCharacterPostfix(character: ")") == successResult)
	}
	
	func testAnyOptionalVa() throws {
		var value: String? = "Good bye!"
		var result = value
			.orOptional("Hello!")
			.nonOptional("Privet!")
		XCTAssert(result == value)
		
		value = nil
		
		result = value
			.orOptional("Hello!")
			.nonOptional("Privet!")
		XCTAssert(result == "Hello!")
		
		result = value
			.orOptional(nil)
			.nonOptional("Privet!")
		XCTAssert(result == "Privet!")
	}
	
	func testAppendToArrayInDictionary() throws {
		var dictionary: [String: [Int]] = ["value": [0, 1, 2]]
		
		XCTAssert(dictionary["v"] == nil)
		
		dictionary.appendWithCreateIfNeed(key: "v", 2)
		
		XCTAssert(dictionary["v"] == [2])
		
		dictionary.appendWithCreateIfNeed(key: "v", 3)
		
		XCTAssert(dictionary["v"] == [2, 3])
	}
}
