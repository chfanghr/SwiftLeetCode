import XCTest

@testable import SwiftLeetCode

class Try2337Cases: XCTestCase {
    func testExampleCases() {
        XCTAssertEqual(
            MovePiecesToObtainAString.canChange(
                "_L__R__R_",
                "L______RR"
            ), true
        )
        XCTAssertEqual(
            MovePiecesToObtainAString.canChange(
                "R_L_",
                "__LR"
            ),
            false
        )
        XCTAssertEqual(
            MovePiecesToObtainAString.canChange(
                "_R",
                "R_"
            ),
            false
        )
        XCTAssertEqual(
            MovePiecesToObtainAString.canChange(
                "_LL__R__R_",
                "L___L___RR"
            ),
            false
        )
        XCTAssertEqual(
            MovePiecesToObtainAString.canChange(
                "R_L__R__R_",
                "_L______RR"
            ),
            false
        )
        XCTAssertEqual(
            MovePiecesToObtainAString.canChange(
                "_L__R__R_L",
                "L______RR_"
            ),
            false
        )
        XCTAssertEqual(
            MovePiecesToObtainAString.canChange(
                "_______LLL",
                "LLL_______"
            ),
            true
        )
    }
}
