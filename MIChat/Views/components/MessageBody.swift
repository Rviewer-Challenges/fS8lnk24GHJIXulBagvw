import SwiftUI

struct MessagesBody: View {
    @EnvironmentObject var firestoreManager: FirestoreManager

    var body: some View {
        ScrollView {
            ForEach(firestoreManager.chats) { chat in
                RecievedMessage(text: chat.message, user: chat.name)
            }
        }.onAppear {
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
