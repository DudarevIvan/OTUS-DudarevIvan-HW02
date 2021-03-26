import XCTest
@testable import FootballNetworking

final class FootballNetworkingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FootballNetworking().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
