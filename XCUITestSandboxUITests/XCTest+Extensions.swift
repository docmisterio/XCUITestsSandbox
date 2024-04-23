import XCTest
import Foundation

/// Best to collect like items in enums for use later, bonus points for good naming so everything is clear. 
enum waitTimeIntervals {
    static let standard: TimeInterval = 2
    static let extended: TimeInterval = 5
}

enum Errors {
    static let couldNotTapOnElement = "Element Could Not Be Tapped On"
}

extension XCTestCase {
    
    enum waitTimeIntervals {
        static let standard = 2
        static let extended = 5
    }
    
    /// we never wanna use this but if we have to use this it's here
    func sleep(forSeconds numberOfSeconds: TimeInterval) {
        Thread.sleep(forTimeInterval: numberOfSeconds)
    }
    
    func waitForExistance(ofElement element: XCUIElement, forSeconds numberOfSeconds: TimeInterval) -> Bool {
        return element.waitForExistence(timeout: numberOfSeconds)
    }
    
    func waitForExistanceAndTap(ofElement element: XCUIElement, forSeconds numberOfSeconds: TimeInterval, andTap: Bool?) {
        if element.waitForExistence(timeout: 2) {
            element.tap()
        } else {
            XCTFail(Errors.couldNotTapOnElement)
        }
    }
}




