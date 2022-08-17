import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            MessagesView()
            FooterView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(FirestoreManager())
    }
}
