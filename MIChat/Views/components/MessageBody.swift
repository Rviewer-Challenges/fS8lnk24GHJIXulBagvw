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
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(firestoreManager.chats, id: \.id) { chat in
                        switch chat.owner {
                        case .mine: SendedMessage(chat: chat)
                        case .other: RecievedMessage(chat: chat)
                        }
                    }
                }
            }.onChange(of: firestoreManager.chats.count) { _ in
                scrollDown(proxy: proxy)
            }
            .onAppear {
                DispatchQueue.main.async {
                    scrollDown(proxy: proxy)
                }
                firestoreManager.username = name
                firestoreManager.getChats()

            }
        }
    }

    private func scrollDown(proxy: ScrollViewProxy) {
        let chatsCount = firestoreManager.chats.count
        if chatsCount > 1 {
            let lastIndex = chatsCount - 1
            proxy.scrollTo(firestoreManager.chats[lastIndex].id)
        }

    }
}

struct MessagesBody_Previews: PreviewProvider {
    static var previews: some View {
        MessagesBody()
            .environmentObject(FirestoreManager())
    }
}





