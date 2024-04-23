import XCTest

class XCUITestSandboxUITests: XCTestCase {
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        /// Nothing currently we'd need to do here in this demo but once could imagine logging out, reseting state, clearing some data
    }
    
    func testLabelShowsTextFieldInput() throws {
        let textField = MainPageObjectModel.TextField.theLoneTextField
        
        try findElement(textField, timeOutAt: waitTimeIntervals.standard, andTap: true)
        textField.typeText(typedText.test)

        verifyElement(MainPageObjectModel.Label.textFieldResult)
    }
    
    func testSliderControlsProgress() {
        
        MainPageObjectModel.adjustSliderTo(number: 1)
        
        guard let completion = MainPageObjectModel.ProgressBar.theLoneProgressBar.value as? String else {
            XCTFail()
            return
        }
        XCTAssertTrue(completion == "0%")
    }
    
    func testButtonsShowAlerts() {
        app.launch()
        MainPageObjectModel.tapBlueColorButton()
        
        XCTAssert(MainPageObjectModel.Alerts.alertBlue.exists)
        MainPageObjectModel.dismissBlueAlert()
    }
    
    func testToggleChangesNavBarText() {
        app.launch()
        MainPageObjectModel.toggleAlphaToOmega()
        
        XCTAssert(MainPageObjectModel.NavBars.omega.exists)
        MainPageObjectModel.toggleOmegaToAlpha()
        
        XCTAssert(MainPageObjectModel.NavBars.alpha.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
