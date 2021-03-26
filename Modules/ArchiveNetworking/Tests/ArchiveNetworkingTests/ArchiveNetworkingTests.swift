import XCTest
@testable import ArchiveNetworking

final class ArchiveNetworkingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ArchiveNetworking().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
