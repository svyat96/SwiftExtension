import XCTest
@testable import SwiftExtension

final class SwiftExtensionTests: XCTestCase {
	func testExample() throws {
		assert("20.0" == .empty.add(20.0))
	}
}
