//  Copyright © 2022 Learnfield GmbH. All rights reserved.

import XCTest
@testable import DI

final class DITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DI().text, "Hello, World!")
    }
}
