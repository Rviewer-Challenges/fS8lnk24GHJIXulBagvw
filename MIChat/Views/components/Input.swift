import SwiftUI
import GoogleSignIn

struct Input: View {
    @State private var text: String = ""
    @EnvironmentObject var firestoreManager: FirestoreManager
    private let user = GIDSignIn.sharedInstance.currentUser

    func saveChat() {
        let chat = IChat(id: NSDate().timeIntervalSince1970,
                         name: user?.profile?.name ?? "Fulanito de tal",
                         message: text)

        firestoreManager.saveChat(chat: chat)
    }

    var body: some View {
        VStack {
            HStack {
                TextField( "What you gonna share?",
                           text: $text)
                .padding(4)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2)
                )
                Image(systemName: "paperplane.fill").resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(.white)
                Button("send"){
                    saveChat()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.orange)
        }
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        Input()
            .environmentObject(FirestoreManager())
    }
}
