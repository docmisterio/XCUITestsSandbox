import XCTest

class XCUITestSandboxUITests: XCTestCase {
    var app = XCUIApplication()
    
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
    
    func testToggle() {
        
        app/*@START_MENU_TOKEN@*/.buttons["Alpha"]/*[[".segmentedControls.buttons[\"Alpha\"]",".buttons[\"Alpha\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Omega"]/*[[".segmentedControls.buttons[\"Omega\"]",".buttons[\"Omega\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        app.buttons["Red"].tap()
        app.alerts["Red"].scrollViews.otherElements.buttons["OK"].tap()
        
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
