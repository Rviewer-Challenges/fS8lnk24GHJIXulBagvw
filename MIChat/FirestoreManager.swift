import Firebase

struct IChat: Identifiable {
    let id: Double
    let name: String
    let message: String
}
class FirestoreManager: ObservableObject {

    @Published var chats: [IChat] = []
    let db: Firestore = Firestore.firestore()


    func fetchChatsRealTime() {
        db.collection("chats")
            .addSnapshotListener { querySnapshot, error in
                   guard let documents = querySnapshot?.documents else {
                       print("Error fetching documents: \(error!)")
                       return
                   }
                self.chats = documents.map {
                    let id = $0["id"] as? Double ?? 0.0
                    let name = $0["name"] as? String ?? ""
                    let message = $0["message"] as? String ?? ""
                    return IChat(id: id, name: name, message: message)
                   }

                print("Current cities in CA: \(self.chats)")
               }

    }

    func saveChat(chat: IChat) {
        let docData: [String: Any] = [
            "id": chat.id,
            "name": chat.name,
            "message": chat.message,
        ]

        db.collection("chats").addDocument(data: docData) { error in

            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }

        }
    }
}

