import XCTest

@testable import SwiftLeetCode

class Try1760Cases: XCTestCase {
    func testExampleCases() {
        XCTAssertEqual(MinimumLimitOfBallsInABag.minimumSize([9], 2), 3)
        XCTAssertEqual(MinimumLimitOfBallsInABag.minimumSize([2, 4, 8, 2], 4), 2)
    }
}
