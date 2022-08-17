import Foundation

enum Owner {
    case mine
    case other
}

struct IChat: Identifiable {
    let id: Double
    let name: String
    let message: String
    var owner: Owner
    var stringDate: String

    init(id: Double, name: String, message: String, owner: Owner) {
        self.id = id
        self.name = name
        self.message = message
        self.owner = owner
        self.stringDate =  getStringHour(epoch: self.id)
    }
}

func getStringHour(epoch: Double) -> String {
    let date = Date(timeIntervalSince1970: epoch)
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    formatter.timeZone = TimeZone(identifier: "Europe/Madrid")
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter.string(from:date)
}

