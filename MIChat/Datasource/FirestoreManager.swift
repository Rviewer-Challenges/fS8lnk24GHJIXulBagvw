import Firebase

class FirestoreManager: ObservableObject {

    let db: Firestore = Firestore.firestore()
    @Published var chats: [IChat] = []
    @Published var username: String = ""
    
    func getChats() {
        db.collection("chats").order(by: "id")
            .addSnapshotListener { [self] querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                self.chats = documents.map {
                    let id = $0["id"] as? Double ?? 0.0
                    let name = $0["name"] as? String ?? ""
                    let message = $0["message"] as? String ?? ""
                    return IChat(id: id,
                                 name: name,
                                 message: message,
                                 owner: self.getOwner(name))
                }
            }
    }
    
    func saveChat(chat: IChat) {
        let docData: [String: Any] = [
            "id": chat.id,
            "name": chat.name,
            "message": chat.message
        ]
        
        db.collection("chats").addDocument(data: docData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
            
        }
    }

    func getOwner(_ chatName: String) -> Owner {
        if (self.username != chatName) {
            return .other
        }
        return .mine
    }
}



