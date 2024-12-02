import Foundation
import Testing
import XCTest

@testable import dsa_swift

class Try2097Cases: XCTestCase {
    func read2097Fixture(fixtureName: String) throws -> [[Int]] {
        struct FixtureNotFoundError: Error {}
        guard let fixtureURL = Bundle.module.url(forResource: fixtureName, withExtension: "json") else {
            throw FixtureNotFoundError()
        }
        let fixtureData = try Data(contentsOf: fixtureURL)
        let decoder = JSONDecoder()
        let fixture = try decoder.decode([[Int]].self, from: fixtureData)
        return fixture
    }

    func testTLECase0() throws {
        let fixture = try read2097Fixture(fixtureName: "2097_0")
        self.measure {
            _ = ValidArrangementOfPairs.validArrangement(fixture)
        }
    }

    func testTLECase1() throws {
        let fixture = try read2097Fixture(fixtureName: "2097_1")
        self.measure {
            _ = ValidArrangementOfPairs.validArrangement(fixture)
        }
    }
}
