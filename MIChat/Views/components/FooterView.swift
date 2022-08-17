import SwiftUI
import GoogleSignIn

struct FooterView: View {
    @State private var text: String = ""
    @EnvironmentObject var firestoreManager: FirestoreManager
    private let user = GIDSignIn.sharedInstance.currentUser

    var body: some View {
        VStack {
            HStack {
                ProfileButtonView()
                InputView(text: $text)
                SendButtonView(action:{ saveChat() })
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 70)
            .background(.orange)
        }
    }

    func saveChat() {
        if (text != "" && user?.profile != nil) {
            let id =  NSDate().timeIntervalSince1970
            let chat = IChat(id: id,
                             name: user!.profile!.name,
                             message: text,
                             owner: .mine)

            firestoreManager.saveChat(chat: chat)
            text = ""
        }
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .environmentObject(FirestoreManager())
    }
}

