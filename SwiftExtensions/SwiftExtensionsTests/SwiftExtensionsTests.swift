//
//  SwiftExtensionsTests.swift
//  SwiftExtensionsTests
//
//  Created by Святослав Спорыхин on 3/20/22.
//

import XCTest
@testable import SwiftExtensions

class SwiftExtensionsTests: XCTestCase {

    func testExample() throws {
		assert("20.0" == .space.add(20.0))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
