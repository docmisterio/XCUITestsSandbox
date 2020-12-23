import XCTest

class XCUITestSandboxUITests: XCTestCase {
    var app = XCUIApplication()
    
    var textfield: XCUIElement { return app.textFields.element }
    var returnButton: XCUIElement { return app.keyboards.buttons["Return"] }
    var textResult: XCUIElement { return app.staticTexts["textArea"] }
    
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
        
        textfield.tap()
        textfield.typeText("test")
        returnButton.tap()
        
        XCTAssertTrue( textResult.label == "test")
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
