import SwiftUI

struct SendButtonView: View {
    var action: () -> Void
    var body: some View {
        Button(
            action: {
                action()
            },
            label: {
                IconView(icon: "paperplane.fill", color: .white, height: 20, padding: 0)
            }
        ).accessibility(label: Text("Send"))
    }
}

struct SendBottonView_Previews: PreviewProvider {
    static var previews: some View {
        SendButtonView(action: {print("holaaaaaa")})
    }
}
