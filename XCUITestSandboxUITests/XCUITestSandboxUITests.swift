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
    
    /// A UITest will usually include some version of the following:
    /// - Setup
    /// - Navigation to the Screen in question
    /// - Performing an action to illicit a result
    /// - Asserting the screen shows what you think it will show given the input
    
    func testLabelShowsTextFieldInput() throws {
        let textField = XCUITestSandBoxObjectModel.TextField.theLoneTextField
        
        try findElement(textField, timeOutAt: waitTimeIntervals.standard, andTap: true)
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
        app.launch()
        XCUITestSandBoxObjectModel.tapBlueColorButton()
        
        XCTAssert(XCUITestSandBoxObjectModel.Alerts.alertBlue.exists)
        XCUITestSandBoxObjectModel.dismissBlueAlert()
    }
    
    func testToggleChangesNavBarText() {
        app.launch()
        XCUITestSandBoxObjectModel.toggleAlphaToOmega()
        
        XCTAssert(XCUITestSandBoxObjectModel.NavBars.omega.exists)
        XCUITestSandBoxObjectModel.toggleOmegaToAlpha()
        
        XCTAssert(XCUITestSandBoxObjectModel.NavBars.alpha.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
