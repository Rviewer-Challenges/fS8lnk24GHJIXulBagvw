import SwiftUI

struct MessagesBody: View {
    
    var body: some View {
        ScrollView {
            Spacer()
            SendedMessage( text: "I received this message")
            RecievedMessage(text: "I wrote this message")
        }
    }
}

struct MessagesBody_Previews: PreviewProvider {
    static var previews: some View {
        MessagesBody()
    }
}
