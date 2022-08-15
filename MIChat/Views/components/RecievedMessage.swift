import SwiftUI

struct RecievedMessage: View {
    var chat: IChat

    var body: some View {
        VStack(spacing: -18){
            HStack {

                Text(chat.stringDate)
                    .font(.caption)
                    .padding(.leading, 30)
                    .padding(.bottom, 5)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.trailing, 20)

            HStack{
                VStack(alignment: .leading, spacing: 5 ) {
                    Text(chat.name)
                        .bold()
                        .font(.caption)
                    Text(chat.message)
                }
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
        RecievedMessage(chat: IChat(
            id: 459845.23423,
            name: "David M.",
            message: "This is a received message",
            owner: .other,
            stringDate: "9:56 pm")
)
    }
}

