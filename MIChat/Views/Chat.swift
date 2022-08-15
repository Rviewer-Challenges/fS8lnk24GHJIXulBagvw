import SwiftUI

struct Chat: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            MessagesBody()
            Input()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(FirestoreManager())
    }
}
