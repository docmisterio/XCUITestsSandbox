import XCTest
/// Best to collect like items in enums for use later, bonus points for good naming so everything is clear.
enum waitTimeIntervals {
    static let standard: TimeInterval = 2
    static let extended: TimeInterval = 5
}

enum typedText {
    static let test = "test"
}

enum Errors {
    static let couldNotFindElement = "Element Could Not Be Found"
    static let couldNotTapOnElement = "Element Could Not Be Tapped On"
}

extension XCTestCase {    
    /// we never wanna use this but if we have to use this it's here
    func sleep(forSeconds numberOfSeconds: TimeInterval) {
        Thread.sleep(forTimeInterval: numberOfSeconds)
    }
    
    func findElement(_ element: XCUIElement, timeOutAt numberOfSeconds: TimeInterval, andTap tap: Bool? = nil) throws {
        guard element.waitForExistence(timeout: 2) else {
            XCTFail(Errors.couldNotFindElement)
            return
        }
        if tap == true {
            element.tap()
        }
    }
    
    func verifyElement(_ element: XCUIElement) {
        XCTAssertTrue(element.exists)
    }
}




