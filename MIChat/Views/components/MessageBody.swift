import SwiftUI
import GoogleSignIn

struct MessagesBody: View {
    @Namespace var bottomID
    @EnvironmentObject var firestoreManager: FirestoreManager
    private let user = GIDSignIn.sharedInstance.currentUser
    private var name:String = ""
    

    init() {
        name =  self.user?.profile?.name ?? ""
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(firestoreManager.chats, id: \.id) { chat in
                        switch chat.owner {
                        case .mine: SendedMessage(text: chat.message, stringDate: chat.stringDate)
                        case .other: RecievedMessage(text: chat.message, user: chat.name)
                        }
                    }
                    Text("").id(bottomID)
                }
            }.onChange(of: firestoreManager.chats.count) { _ in
                proxy.scrollTo(bottomID)
            }
            .onAppear {
                DispatchQueue.main.async {
                    proxy.scrollTo(bottomID)
                }
                firestoreManager.username = name
                firestoreManager.fetchChatsRealTime()

            }
        }
    }
}


struct MessagesBody_Previews: PreviewProvider {
    static var previews: some View {
        MessagesBody()
            .environmentObject(FirestoreManager())
    }
}





