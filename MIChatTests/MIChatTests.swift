import XCTest
@testable import MIChat

class MIChatTests: XCTestCase {
    
    var firebaseManager: FirestoreManager!
    var username: String!
    var epoch: Double!
    var othername: String!
    
    
    override func setUpWithError() throws {
        firebaseManager = FirestoreManager()
        firebaseManager.username = name
        username = "Fulanito de tal"
        othername = "Marifé de Rhianna"
        epoch = 1660580209.747339  // 👉 2022-08-15 16:16:49 +0000
        // let date = Date(timeIntervalSince1970: epoch)
    }
    
    override func tearDownWithError() throws {
        firebaseManager = nil
        username = nil
        epoch = nil
    }
    
    func testGetStringHour() throws {
        // To get another epoch date getNewDate()
        let epoch2 = 1660638831.143148 // 👉 2022-08-15 16:16:49 +0000
        let dateString = getStringHour(epoch: epoch)
        let dateString2 = getStringHour(epoch: epoch2)
        XCTAssertEqual(dateString, "18:16") // + 2 horas TIMEZONE:  Europe/MADRID
        XCTAssertEqual(dateString2, "10:33") // + 2 horas TIMEZONE: Europe/MADRID
    }
    
    func testGetStringHourFromChat() throws {
        let chat: IChat = .init(id: epoch,
                                name: username,
                                message: "This is a message",
                                owner: firebaseManager.getOwner(username))
        
        XCTAssertEqual(chat.stringDate, "18:16")
    }
    
    func getOtherOwnerFromChat() {
        let chatMine: IChat = .init(id: epoch,
                                    name: othername,
                                    message: "This is a message",
                                    owner: firebaseManager.getOwner(othername))
        
        let chatOther: IChat = .init(id: epoch,
                                     name: username,
                                     message: "This is a message",
                                     owner: firebaseManager.getOwner(username))
        
        XCTAssertEqual(chatMine.owner, .mine)
        XCTAssertEqual(chatOther.owner, .other)
    }
    
    func testGetOwner() throws {
        let ownerMine: Owner = firebaseManager.getOwner(name)
        let ownerOther: Owner = firebaseManager.getOwner(othername)
        
        XCTAssertEqual(ownerMine, .mine)
        XCTAssertEqual(ownerOther, .other)
    }
    
    private func getNewDate() -> Void{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let epoch = date.timeIntervalSince1970
        // + 2 👉 Timezone Europa/Madrid
        let stringHour = "\(hour + 2):\(minute)"
        print("epoch: \(epoch) -- stringHour: \(stringHour)")
    }
    
}
