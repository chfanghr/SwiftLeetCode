import Foundation
import XCTest

@testable import SwiftLeetCode

class Try2981Cases: XCTestCase {
    func testExampleCases() throws {
        XCTAssertEqual(FindLongestSpecialSubstringThatOccursTriceI.maximumLength("aaaa"), 2)
        XCTAssertEqual(FindLongestSpecialSubstringThatOccursTriceI.maximumLength("abcdef"), -1)
        XCTAssertEqual(FindLongestSpecialSubstringThatOccursTriceI.maximumLength("abcaba"), 1)
        XCTAssertEqual(FindLongestSpecialSubstringThatOccursTriceI.maximumLength("eccdnmcnkl"), 1)
    }
}
