import XCTest

@testable import SwiftLeetCode

class Try3152Cases: XCTestCase {
    func testExampleCases() {
        XCTAssertEqual(
            [false],
            SpecialArrayII.isArraySpecial([3,4,1,2,6], [[0,4]])
        )
        XCTAssertEqual(
            [false, true],
            SpecialArrayII.isArraySpecial([4,3,1,6], [[0,2],[2,3]])
        )
    }
}
