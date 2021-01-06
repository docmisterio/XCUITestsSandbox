import Foundation
import XCTest

class MainPageObjectModel {
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
    
    static func labelResultShowsTextFieldInput() {
        MainPageObjectModel.TextField.theLoneTextField.tap()
        MainPageObjectModel.TextField.theLoneTextField.typeText("test")
        MainPageObjectModel.Buttons.returnButton.tap()
    }
    
    static func adjustSliderTo(number: CGFloat) {
        MainPageObjectModel.Slider.theLoneSlider.adjust(toNormalizedSliderPosition: number)
    }
    
    static func tapBlueColorButton() {
        MainPageObjectModel.Buttons.blueButton.tap()
    }
    
    static func dismissBlueAlert() {
        MainPageObjectModel.Alerts.alertBlue.tap()
    }
    
    static func toggleAlphaToOmega() {
        MainPageObjectModel.Toggles.omegaToggle.tap()
    }
    
    static func toggleOmegaToAlpha() {
        MainPageObjectModel.Toggles.alphaToggle.tap()
    }
}
