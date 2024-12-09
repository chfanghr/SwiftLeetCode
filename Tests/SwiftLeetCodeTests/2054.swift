import Foundation
import XCTest

@testable import SwiftLeetCode

class Try2054Cases: XCTestCase {
    func testExampleCases() {
        XCTAssertEqual(
            4, TwoBestNonOverlappingEvents.maxTwoEvents([[1, 3, 2], [4, 5, 2], [2, 4, 3]]))
        XCTAssertEqual(
            5, TwoBestNonOverlappingEvents.maxTwoEvents([[1, 3, 2], [4, 5, 2], [1, 5, 5]]))
        XCTAssertEqual(
            8, TwoBestNonOverlappingEvents.maxTwoEvents([[1, 5, 3], [1, 5, 1], [6, 6, 5]]))
        XCTAssertEqual(
            165,
            TwoBestNonOverlappingEvents.maxTwoEvents([
                [66, 97, 90], [98, 98, 68], [38, 49, 63], [91, 100, 42], [92, 100, 22],
                [1, 77, 50], [64, 72, 97],
            ]))
        XCTAssertEqual(
            173,
            TwoBestNonOverlappingEvents.maxTwoEvents([
                [28, 81, 48], [27, 90, 94], [97, 99, 79], [5, 35, 81], [65, 94, 84], [65, 83, 58],
                [94, 94, 31], [39, 52, 73],
            ]))
    }
}
