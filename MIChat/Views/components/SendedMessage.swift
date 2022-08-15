import SwiftUI

struct SendedMessage: View {
    var chat: IChat

    var body: some View {
        VStack(spacing: -20){
            HStack {
                Spacer()
                Text(chat.stringDate)
                    .font(.caption)
                    .padding(8)
            }
            .frame(maxWidth: .infinity)
            .padding(.trailing, 20)
            HStack{
                Spacer()
                Text(chat.message)
                    .bold()
                    .padding(.trailing, 20)
                    .padding(.leading, 35)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .foregroundColor(.white)
                    .background(Color(0xFF8707, alpha: 0.9))
                    .clipShape(
                        RoundCorner(
                            cornerRadius: 12,
                            maskedCorners: [.topLeft, .bottomLeft, .topRight]
                        )
                    )
            }

            .padding()
        }.frame(maxWidth: .infinity)
    }
}

struct SendedMessage_Previews: PreviewProvider {
    static var previews: some View {
        SendedMessage(chat: IChat(
            id: 459845.23423,
            name: "David M.",
            message: "This is a received message",
            owner: .other,
            stringDate: "9:56 pm"))
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

struct RoundCorner: Shape {
    var cornerRadius: CGFloat
    var maskedCorners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: maskedCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

// Kudos https://stackoverflow.com/questions/71248005/round-specific-corners-in-a-swiftui-mac-app
