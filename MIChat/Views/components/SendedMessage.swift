import SwiftUI
import GoogleSignIn

struct SendedMessage: View {
    var text: String
    private let user = GIDSignIn.sharedInstance.currentUser

    var body: some View {
        VStack(spacing: -19){
            HStack {
              Spacer()
                Text(user?.profile?.name ?? "Me")
                    .font(.caption)
                    .padding(8)
            }
            .frame(maxWidth: .infinity)
            .padding(.trailing, 30)
            HStack{
                Spacer()
                Text(text)
                    .padding(.trailing, 20)
                    .padding(.leading, 35)
                    .padding(.top, 6)
                    .padding(.bottom, 6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange, lineWidth: 2)
                    )
            }
            .padding()
        }.frame(maxWidth: .infinity)
    }
}

struct SendedMessage_Previews: PreviewProvider {
    static var previews: some View {
        SendedMessage(text: "This is sended Message")
    }
}
