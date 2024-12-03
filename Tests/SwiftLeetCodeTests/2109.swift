import XCTest

@testable import SwiftLeetCode

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

    func testTLECase() throws {
        let question: Question = try readFixture(fixtureName: "2109_0")
        let expectedAnswer: String = try readFixture(fixtureName: "2109_0_expected")
        self.measure {
            let answer = AddingSpacesToAString.addSpaces(question.s, question.spaces)
            XCTAssertEqual(answer, expectedAnswer)
        }
    }
}
