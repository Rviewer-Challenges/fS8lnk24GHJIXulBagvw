import SwiftUI

struct RecievedMessage: View {
    var text: String
    var user: String

    var body: some View {
        VStack(spacing: -18){
            HStack {
                Text(user)
                    .font(.caption)
                    .padding(8)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 30)
            HStack{
                Text(text)
                    .padding(.leading, 20)
                    .padding(.trailing, 35)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(Color(0xFF8707, alpha: 0.3))
                    .clipShape(
                        RoundCorner(
                            cornerRadius: 12,
                            maskedCorners: [.topLeft, .bottomRight, .topRight]
                        )
                    )
                Spacer()
            }
            .padding()
        }.frame(maxWidth: .infinity)

    }
}

struct RecievedMessage_Previews: PreviewProvider {
    static var previews: some View {
        RecievedMessage(text: "This a recieved Message", user: "David M.")
    }
}
