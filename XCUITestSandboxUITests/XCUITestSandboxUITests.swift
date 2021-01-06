import XCTest

class XCUITestSandboxUITests: XCTestCase {
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    
    }
    
    func testLabelShowsTextFieldInput() throws {
        app.launch()
        MainPageObjectModel.labelResultShowsTextFieldInput()
        
        XCTAssert(MainPageObjectModel.Label.textFieldResult.exists)
    }
    
    func testSliderControlsProgress() {
        app.launch()
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
