import XCTest

class XCUITestSandboxUITests: XCTestCase {
    var app = XCUIApplication()
    
    var slider: XCUIElement { return app.sliders["Completion"] }
    var progressBar: XCUIElement { return app.progressIndicators.element }
    
    var blueButton: XCUIElement { return app.staticTexts["Blue"] }
    var blueButtonAlert: XCUIElement { return app.alerts["Blue"] }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    
    }
    
    func testLabelCopiesTextField() throws {
        app.launch()
        
        MainScreen.textField.pageElement.tap()
        MainScreen.textField.pageElement.typeText("test")
        MainScreen.returnButton.pageElement.tap()
        
        XCTAssertTrue(MainScreen.textResult.pageElement.label == "test")
    }
    
    func testSliderControlsProgress() {
        app.launch()
        
        slider.adjust(toNormalizedSliderPosition: 1)
        guard let completion = progressBar.value as? String else {
            XCTFail()
            return
        }
        XCTAssertTrue(completion == "0%")
    }
    
    func testButtonsShowAlerts() {
        app.launch()
        
        blueButton.tap()
        XCTAssertTrue(blueButtonAlert.exists)
        blueButtonAlert.buttons["OK"].tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

enum MainScreen {
    case textField, returnButton, textResult
    
    var pageElement: XCUIElement {
        switch self {
        case .textField:
            return XCUIApplication().textFields.element
        case .textResult:
            return XCUIApplication().staticTexts["textArea"]
        case .returnButton:
            return XCUIApplication().keyboards.buttons["Return"]
        }
    }
}
