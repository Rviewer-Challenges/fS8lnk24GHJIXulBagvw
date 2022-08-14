import SwiftUI
import GoogleSignIn

struct MessagesBody: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    private let user = GIDSignIn.sharedInstance.currentUser
    private var name:String = ""

    init() {
        name =  self.user?.profile?.name ?? ""
    }

    var body: some View {
        ScrollView {
            ForEach(firestoreManager.chats) { chat in
                switch chat.owner {
                     case .mine: SendedMessage(text: chat.message)
                     case .other: RecievedMessage(text: chat.message, user: chat.name)
                   }
            }
        }.onAppear {
            firestoreManager.username = name
            firestoreManager.fetchChatsRealTime()
        }
    }
}

struct MessagesBody_Previews: PreviewProvider {
    static var previews: some View {
        MessagesBody()
            .environmentObject(FirestoreManager())
    }
}

class FirestoreManagerMock: ObservableObject {
    var username = "Diana Hernández"
    var chats = [
        IChat(id: 1.0, name: "Diana Hernández", message: "Hola que ase", owner: .mine),
        IChat(id: 2.0, name: "Federico", message: "para que quieres saber es0? Saludos", owner: .other),
        IChat(id: 3.0, name: "Diana Hernández", message: "Hola otra vez", owner: .mine),
        IChat(id: 4.0, name: "Aurora", message: "Te gusta ser tonta?", owner: .other),
    ]

    func fetchChatsRealTime() {
        print("mock fetch chats")
    }
}
