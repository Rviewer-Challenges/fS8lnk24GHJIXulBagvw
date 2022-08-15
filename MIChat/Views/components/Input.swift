import SwiftUI
import GoogleSignIn

struct Input: View {
    @State private var text: String = ""
    @EnvironmentObject var firestoreManager: FirestoreManager
    private let user = GIDSignIn.sharedInstance.currentUser

    func saveChat() {
        if (text != "") {
            let id =  NSDate().timeIntervalSince1970
            let chat = IChat(id: id,
                             name: user?.profile?.name ?? "Fulanito de tal",
                             message: text,
                             owner: .mine,
                             stringDate: firestoreManager.getStringHour(epoch: id))

            firestoreManager.saveChat(chat: chat)
        }
    }

    var body: some View {
        VStack {
            HStack {
                ProfileButtonView()
                    .padding(.top, 10)
                TextField( "What you gonna share?",
                           text: $text)
                .modifier(TextFieldClearButton(text: $text))
                .padding(4)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2)
                )
                Button(
                    action: {
                        saveChat();
                        self.text = ""
                    },
                    label: {
                        IconView(icon: "paperplane.fill", color: .white, height: 20, padding: 0)
                    }
                )
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 70)
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

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        HStack {
            content

            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}
