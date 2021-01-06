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
        MainPage.labelResultShowsTextFieldInput()
        
        XCTAssert(MainPage.label.textFieldResult.exists)
    }
    
    func testSliderControlsProgress() {
        app.launch()
        MainPage.adjustSliderTo(number: 1)
        
        guard let completion = MainPage.progressBar.theLoneProgressBar.value as? String else {
            XCTFail()
            return
        }
        XCTAssertTrue(completion == "0%")
    }
    
    func testButtonsShowAlerts() {
        app.launch()
        MainPage.tapBlueColorButton()
        
        XCTAssert(MainPage.alerts.alertBlue.exists)
        MainPage.dismissBlueAlert()
    }
    
    func testToggle() {
        
    
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
