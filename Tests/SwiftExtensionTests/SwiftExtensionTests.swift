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
	
	var testMainCombineCancellable: AnyCancellable?
	var testGlobalCombineCancellable: AnyCancellable?
	var testOnlyGlobalCombineCancellable: AnyCancellable?
	
	var timer: Timer?
	@Published var testCombineValue: Int = 0
	
	func testCombine() throws {
		let completedExpectation = expectation(description: "Completed")
		testMainCombineCancellable = $testCombineValue
			.autoReceiveInMainQueue()
			.sink { value in
				XCTAssert(Thread.isMainThread, "Only main!")
			}
		
		testGlobalCombineCancellable = $testCombineValue
			.sink { value in
				XCTAssert(Thread.isMainThread == false || Thread.isMainThread == true,  "Background && Main!")
			}
		
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
			DispatchQueue.global(qos: .background).async { [weak self] in
				self?.testOnlyGlobalCombineCancellable = self?.$testCombineValue
					.sink { value in
						XCTAssert(Thread.isMainThread == false, "Only background!")
					}
				self?.testCombineValue = 10
				completedExpectation.fulfill()
			}
		}
		waitForExpectations(timeout: 5, handler: nil)
	}
}
