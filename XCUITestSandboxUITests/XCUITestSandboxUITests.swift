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
        let textField = XCUITestSandBoxObjectModel.TextField.theLoneTextField
        
        findElement(textField, timeOutAt: WaitTimes.standard, andTap: true)
        textField.typeText(typedText.test)

        verifyElement(XCUITestSandBoxObjectModel.Label.textFieldResult)
    }
    
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
        
        XCTAssertFalse(alertBlue.exists)
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
