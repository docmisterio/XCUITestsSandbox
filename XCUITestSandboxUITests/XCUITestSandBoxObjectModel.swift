import Foundation
import XCTest

class XCUITestSandBoxObjectModel {
    enum Buttons {
        static let redButton = XCUIApplication().buttons["Red"]
        static let greenButton = XCUIApplication().buttons["Green"]
        static let blueButton = XCUIApplication().buttons["Blue"]
        static let returnButton = XCUIApplication().keyboards.buttons["Return"]
    }
    
    enum TextField {
        static let theLoneTextField = XCUIApplication().textFields["textField"]
    }
    
    enum Label {
        static let textFieldResult = XCUIApplication().staticTexts["test"]
    }
    
    enum Slider {
        static let theLoneSlider = XCUIApplication().sliders["Completion"]
    }
    
    enum ProgressBar {
        static let theLoneProgressBar = XCUIApplication().progressIndicators.element
    }
    
    enum Toggles {
        static let alphaToggle = XCUIApplication().buttons["Alpha"]
        static let omegaToggle = XCUIApplication().buttons["Omega"]
    }
    
    enum Alerts {
        static let alertBlue = XCUIApplication().alerts["Blue"].buttons["OK"]
        static let alertRed = XCUIApplication().alerts["Red"].buttons["OK"]
        static let alertGreen = XCUIApplication().alerts["Green"].buttons["OK"]
    }
    
    enum NavBars {
        static let alpha = XCUIApplication().navigationBars["Alpha"].staticTexts["Alpha"]
        static let omega = XCUIApplication().navigationBars["Omega"].staticTexts["Omega"]
    }
    
    static func adjustSliderTo(number: CGFloat) {
        XCUITestSandBoxObjectModel.Slider.theLoneSlider.adjust(toNormalizedSliderPosition: number)
    }
    
    static func dismissBlueAlert() {
        XCUITestSandBoxObjectModel.Alerts.alertBlue.tap()
    }
    
    static func toggleAlphaToOmega() {
        XCUITestSandBoxObjectModel.Toggles.omegaToggle.tap()
    }
    
    static func toggleOmegaToAlpha() {
        XCUITestSandBoxObjectModel.Toggles.alphaToggle.tap()
    }
}
