import XCTest

/// These are currently all in the realm of "Success Flow" Tests as they're all about the app successfully doing what we want it to do. Failure Flows, while not represented here would be something like ensuring the app fails successfully - not to be confused with negative testing.

class XCUITestSandboxUITests: XCTestCase {
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
        /// Additional items to consider for setup is passing launch args that may flip UserDefaults flags, log in, ready or seed some data used by all tests
    }

    override func tearDownWithError() throws {
        /// Nothing currently we'd need to do here in this demo but once could imagine logging out, reseting state, clearing some data
    }
    
    /// A UITest will usually include some version of the following:
    /// - Setup
    /// - Navigation to the Screen in question
    /// - Performing an action to illicit a result
    /// - Asserting the screen shows what you think it will show given the input
    
    func testLabelShowsTextFieldInput() throws {
        let textField = XCUITestSandBoxObjectModel.TextField.theLoneTextField
        
        findElement(textField, timeOutAt: WaitTimes.standard, andTap: true)
        textField.typeText(typedText.test)

        /// It's important to use the XCUIElement version of what appears on the label cause that asserts and confirms what we typed in the TextField is showing in the Label Field
        verifyElement(XCUITestSandBoxObjectModel.Label.textFieldResult)
    }
    
    /// The next two tests are slider tests that make sure they are controling the progress bar beneath it. Two things:
    /// 1. We could have abstracted this out to one tests that inputs a random number, done some math and come up with what we THINK will be the percentage to test this dynamically but it's important to note that each step we take away from predictability in any given test is a step away from quality.
    /// 2. Unlike Unit Tests, UITests should be using the UI to perform whatever Business Case it's trying to assert.
    
    func testSliderControlsProgressTo100() {
        XCUITestSandBoxObjectModel.adjustSliderTo(number: SliderPositions.one)
        
        guard let completion = XCUITestSandBoxObjectModel.ProgressBar.theLoneProgressBar.value as? String else {
            XCTFail(Failures.couldNotConvertPercentageToString)
            return
        }
        
        XCTAssertTrue(completion == ProgressBarPercentages.OneHundredPercent)
    }
    
    func testSliderControlsProgressTo0() {
        XCUITestSandBoxObjectModel.adjustSliderTo(number: SliderPositions.zero)
        
        guard let completion = XCUITestSandBoxObjectModel.ProgressBar.theLoneProgressBar.value as? String else {
            XCTFail(Failures.couldNotConvertPercentageToString)
            return
        }
        XCTAssertTrue(completion == ProgressBarPercentages.zeroPercent)
    }
    
    func testButtonsShowAlerts() {
        let buttonBlue = XCUITestSandBoxObjectModel.Buttons.blueButton
        let alertBlue = XCUITestSandBoxObjectModel.Alerts.alertBlue
        
        findElement(buttonBlue, timeOutAt: WaitTimes.standard, andTap: true)
        
        verifyElement(alertBlue)
        XCUITestSandBoxObjectModel.dismissBlueAlert()
        
        XCTAssertFalse(alertBlue.exists) /// here we are asserting the previously dismissed DOES NOT exist as a final assertion because that Flow ends here.
    }
    
    func testToggleChangesNavBarText() {
        let NavBarOmega = XCUITestSandBoxObjectModel.NavBars.omega
        let NavBarAlpha = XCUITestSandBoxObjectModel.NavBars.alpha
        
        XCUITestSandBoxObjectModel.toggleAlphaToOmega()
        
        verifyElement(NavBarOmega)
        XCUITestSandBoxObjectModel.toggleOmegaToAlpha()
        
        verifyElement(NavBarAlpha)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
