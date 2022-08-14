import Firebase

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
}

class FirestoreManager: ObservableObject {
    
    @Published var chats: [IChat] = []
    let db: Firestore = Firestore.firestore()
    @Published var username: String = ""
    
    func fetchChatsRealTime() {
        db.collection("chats").order(by: "id")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                self.chats = documents.map {
                    let id = $0["id"] as? Double ?? 0.0
                    let name = $0["name"] as? String ?? ""
                    let message = $0["message"] as? String ?? ""
                    var owner: Owner = .mine
                    if (self.username != name) {
                        owner = .other
                    }
                    return IChat(id: id, name: name, message: message, owner: owner, stringDate: self.getStringHour(epoch: id))
                }
            }
    }
    
    func saveChat(chat: IChat) {
        let docData: [String: Any] = [
            "id": chat.id,
            "name": chat.name,
            "message": chat.message,
            "stringDate": self.getStringHour(epoch: chat.id)
        ]
        
        db.collection("chats").addDocument(data: docData) { error in
            
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
            
        }
    }
    
    func saveUser(name: String, idToken: String, accessToken: String) {
        let docData: [String: Any] = [
            "name": name,
            "idToken": idToken,
            "accessToken": accessToken,
            "logged": true
        ]
        
        db.collection("users").addDocument(data: docData) { error in
            
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
            
        }
    }
    
    func signOut(id: String) {
        db.collection("users").document(id).updateData(["logged": false]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
            
        }
    }
    
    func getUser(id: String, _ changeState: @escaping (Bool) -> Void) {
        let docRef = db.collection("users").document(id)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                let logged = dataDescription!["logged"] as? Bool
                changeState(logged ?? false)
            } else {
                print("Document does not exist")
            }
        }
        
    }
    
    func getStringHour(epoch: Double) -> String {
        let date = Date(timeIntervalSince1970: epoch)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        formatter.timeZone = TimeZone(identifier: "Europe/Madrid")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from:date)
        
    }
}

