import Foundation
import Testing
import XCTest

@testable import SwiftLeetCode

class Try2097Cases: XCTestCase {
    func testTLECase0() throws {
        let fixture: [[Int]] = try readFixture(fixtureName: "2097_0")
        self.measure {
            _ = ValidArrangementOfPairs.validArrangement(fixture)
        }
    }

    func testTLECase1() throws {
        let fixture: [[Int]] = try readFixture(fixtureName: "2097_1")
        self.measure {
            _ = ValidArrangementOfPairs.validArrangement(fixture)
        }
    }
}
