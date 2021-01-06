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
        
        MainPage.slider.theLoneSlider.adjust(toNormalizedSliderPosition: 1)
        guard let completion = MainPage.progressBar.theLoneProgressBar.value as? String else {
            XCTFail()
            return
        }
        XCTAssertTrue(completion == "0%")
    }
    
    func testButtonsShowAlerts() {
        app.launch()
        
//        blueButton.tap()
//        XCTAssertTrue(blueButtonAlert.exists)
//        blueButtonAlert.buttons["OK"].tap()
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
