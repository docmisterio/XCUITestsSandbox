import Foundation
import XCTest

class MainPage {
    struct Buttons {
        let redButton: XCUIElement
        let greenButton: XCUIElement
        let blueButton: XCUIElement
        let returnButton: XCUIElement
    }
    
    struct TextField {
        let theLoneTextField: XCUIElement
    }
    
    struct Label {
        let textFieldResult: XCUIElement
    }
    
    struct Slider {
        let theLoneSlider: XCUIElement
    }
    
    struct ProgressBar {
        let theLoneProgressBar: XCUIElement
    }
    
    struct Toggle {
        let alphaToggle: XCUIElement
        let omegaToggle: XCUIElement
    }
    
    struct Alerts {
        let alertBlue: XCUIElement
        let alertRed: XCUIElement
        let alertGreen: XCUIElement
    }
    
    static let buttons = Buttons(
        redButton: XCUIApplication().buttons["Red"],
        greenButton: XCUIApplication().buttons["Green"],
        blueButton: XCUIApplication().buttons["Blue"],
        returnButton: XCUIApplication().keyboards.buttons["Return"]
    )
    
    static let textField = TextField(
        theLoneTextField: XCUIApplication().textFields["textField"]
    )
    
    static let label = Label(
        textFieldResult: XCUIApplication().staticTexts["test"]
    )
    
    static let slider = Slider(
        theLoneSlider: XCUIApplication().sliders["Completion"]
    )
    
    static let progressBar = ProgressBar(
        theLoneProgressBar: XCUIApplication().progressIndicators.element
    )
    
    static let toggle = Toggle(
        alphaToggle: XCUIApplication().buttons["Alpha"],
        omegaToggle: XCUIApplication().buttons["Omega"]
    )
    
    static let alerts = Alerts(
        alertBlue: XCUIApplication().alerts["Blue"].buttons["OK"],
        alertRed: XCUIApplication().alerts["Red"].buttons["OK"],
        alertGreen: XCUIApplication().alerts["Green"].buttons["OK"]
    )
    
    static func labelResultShowsTextFieldInput() {
        MainPage.textField.theLoneTextField.tap()
        MainPage.textField.theLoneTextField.typeText("test")
        MainPage.buttons.returnButton.tap()
    }
    
    static func adjustSliderTo(number: CGFloat) {
        MainPage.slider.theLoneSlider.adjust(toNormalizedSliderPosition: number)
    }
    
    static func tapBlueColorButton() {
        MainPage.buttons.blueButton.tap()
    }
    
    static func dismissBlueAlert() {
        MainPage.alerts.alertBlue.tap()
    }
}
