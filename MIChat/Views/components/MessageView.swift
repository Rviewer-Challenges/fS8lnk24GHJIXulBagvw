import SwiftUI

struct MessageView: View {
    var chat: IChat
    var options: Options = Mine()

    init(chat: IChat) {
        self.chat = chat
        self.options = self.setOptions(chat: chat)
    }

    private func setOptions(chat: IChat) -> Options {
        switch chat.owner {
        case .other:  return Other(name: chat.name)
        case .mine:  return Mine()
        }
    }

    var body: some View {
        VStack(spacing: -20){
            HStack {
                if (chat.owner == .mine) {
                    Spacer()
                }
                Text(chat.stringDate)
                    .font(.caption)
                    .padding(.leading, 28)
                    .padding(.trailing, 10)
                    .padding(.bottom, 6)
                if (chat.owner == .other) {
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.trailing, 20)

            HStack{
                if (chat.owner == .mine) {
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text(self.options.name)
                        .bold()
                        .font(.caption)
                        .padding(.top, self.options.paddingName)

                    Text(chat.message)
                }
                .padding(.leading, 20)
                .padding(.trailing, 35)
                .padding(.top, 10)
                .padding(.bottom, 10)
                .background(Color(0xFF8707, alpha: self.options.opacity))
                .clipShape(
                    RoundCorner(
                        cornerRadius: 12,
                        maskedCorners: self.options.rounderCorners
                    )
                )
                if (chat.owner == .other) {
                    Spacer()
                }
            }
            .padding()
        }.frame(maxWidth: .infinity)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{

            MessageView(chat: IChat(
                id: NSDate().timeIntervalSince1970,
                name: "David M.",
                message: "Hola que ase",
                owner: .other))

            MessageView(chat: IChat(
                id: NSDate().timeIntervalSince1970,
                name: "Diana Hernández",
                message: "¿Cómo te llamas?",
                owner: .mine))

            MessageView(chat: IChat(
                id: NSDate().timeIntervalSince1970,
                name: "David M.",
                message: "Para que quieres saber eso, saludos",
                owner: .other))

        }

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
