import XCTest

@testable import SwiftLeetCode

class Try2825Cases: XCTestCase {
    func testCyclicIncrease() {
        XCTAssertEqual(
            "a" as Character,
            (0...25).reduce(
                "a",
                { acc, _ in
                    MakeStringASubsequenceUsingCyclicIncrements.cyclicIncrease(acc)
                }))
    }

    func testExampleCases() {
        XCTAssertEqual(
            MakeStringASubsequenceUsingCyclicIncrements.canMakeSubsequence("abc", "ad"),
            true
        )
        XCTAssertEqual(
            MakeStringASubsequenceUsingCyclicIncrements.canMakeSubsequence("zc", "ad"),
            true
        )
        XCTAssertEqual(
            MakeStringASubsequenceUsingCyclicIncrements.canMakeSubsequence("ab", "d"),
            false
        )
    }
}
