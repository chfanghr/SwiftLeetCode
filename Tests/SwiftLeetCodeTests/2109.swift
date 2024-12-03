import XCTest

@testable import SwiftLeetCode

struct FixtureNotFoundError: Error {
}

struct Question: Codable {
    let s: String
    let spaces: [Int]
}

class Try2109Cases: XCTestCase {
    func testExampleCases() {
        XCTAssertEqual(AddingSpacesToAString.addSpaces("LeetcodeHelpsMeLearn", [8,13,15]), "Leetcode Helps Me Learn")
        XCTAssertEqual(AddingSpacesToAString.addSpaces("icodeinpython", [1,5,7,9]), "i code in py thon")
        XCTAssertEqual(AddingSpacesToAString.addSpaces("spacing", [0,1,2,3,4,5,6]), " s p a c i n g")
    }


    func readFixture<T>(fixtureName: String) throws -> T where T: Decodable {
        guard let fixtureURL = Bundle.module.url(forResource: fixtureName, withExtension: "json") else {
            throw FixtureNotFoundError()
        }
        let fixtureData = try Data(contentsOf: fixtureURL)
        let decoder = JSONDecoder()
        let fixture = try decoder.decode(T.self, from: fixtureData)
        return fixture
    }

    func testTLECase() throws {
        let question: Question = try readFixture(fixtureName: "2109_0")
        let expectedAnswer: String = try readFixture(fixtureName: "2109_0_expected")
        self.measure {
            let answer = AddingSpacesToAString.addSpaces(question.s, question.spaces)
            XCTAssertEqual(answer, expectedAnswer)
        }
    }
}
