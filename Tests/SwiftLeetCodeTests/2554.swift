import XCTest

@testable import SwiftLeetCode

class Try2554Cases: XCTestCase {
    func testExampleCases() {
        XCTAssertEqual(MaximumNumberOfIntegersToChooseFromARangeI.maxCount([1, 6, 5], 5, 6), 2)
        XCTAssertEqual(MaximumNumberOfIntegersToChooseFromARangeI.maxCount([1, 2, 3, 4, 5, 6, 7], 8, 1), 0)
        XCTAssertEqual(MaximumNumberOfIntegersToChooseFromARangeI.maxCount([11], 7, 50), 7)
    }
}
