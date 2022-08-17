import SwiftUI

struct InputView: View {
    @Binding var text: String

    var body: some View {
        TextField( "Escribe tu mensaje...",
                   text: $text)

        .modifier(TextFieldClearButton(text: $text))
        .padding(4)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        ).accessibility(label: Text("Text field chat"))
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
