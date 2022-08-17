import XCTest


class MIChatUITests: XCTestCase {

    var messageText: String!

    override func setUpWithError() throws {
        continueAfterFailure = false
        messageText = "This is mesasge form the UITest file"
    }

    override func tearDownWithError() throws {
        messageText = nil
    }

//    func testLoginPage() {
//        // Given
//        let app = XCUIApplication()
//        app.launch()
//
//        let title = app.staticTexts["💬 Welcome to Michat!"]
//        let subtitle = app.staticTexts["Chat with people around the world 🌎"]
//
//        // Then
//        XCTAssert(title.exists)
//        XCTAssert(subtitle.exists)
//    }
//
//    func testNavigationTitle() throws {
//
//        // Given
//        let app = XCUIApplication()
//        app.launch()
//
//        // When
//        app/*@START_MENU_TOKEN@*/.buttons["app title"]/*[[".buttons[\"Sign in\"]",".buttons[\"app title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.alerts["“MIChat” quiere utilizar “google.com” para iniciar sesión"].scrollViews.otherElements.buttons["Continuar"].tap()
//        app/*@START_MENU_TOKEN@*/.webViews.webViews.webViews.staticTexts["dianait.dev@gmail.com"]/*[[".otherElements[\"BrowserView?WebViewProcessID=82597\"].webViews.webViews.webViews",".otherElements[\"Acceso: Cuentas de Google\"]",".links[\"Sarah Connor dianait.dev@gmail.com\"]",".links.staticTexts[\"dianait.dev@gmail.com\"]",".staticTexts[\"dianait.dev@gmail.com\"]",".webViews.webViews.webViews"],[[[-1,5,1],[-1,0,1]],[[-1,4],[-1,3],[-1,2,3],[-1,1,2]],[[-1,4],[-1,3],[-1,2,3]],[[-1,4],[-1,3]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.textFields["app title"]/*[[".textFields[\"What you gonna share?\"]",".textFields[\"app title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        // Then
//        let titleApp = app.staticTexts["💬 MICHAT"]
//        XCTAssert(titleApp.exists)
//    }
//
//    func testSendChat() {
//        // Given
//        let app = XCUIApplication()
//
//        // When
//        let textField = app/*@START_MENU_TOKEN@*/.textFields["app title"]/*[[".textFields[\"What you gonna share?\"]",".textFields[\"app title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        textField.tap()
//        textField.typeText(messageText)
//        app.buttons["Send"].tap()
//
//        // Then
//        let message = app.staticTexts[messageText]
//        XCTAssert(message.exists)
//        XCTAssertEqual(messageText, message.label)
//    }
//
//    func testLogout() {
//         // Given
//        let app = XCUIApplication()
//        app.launch()
//
//        let profileButton = app.otherElements.buttons["Profile Button"]
//        XCTAssert(profileButton.exists)
//
//        // When
//        profileButton.tap()
//        let singOutButton = app.buttons["Sign out"]
//        XCTAssert(singOutButton.exists)
//        singOutButton.tap()
//
//
//         // Then
//        testLoginPage()
//    }

}
