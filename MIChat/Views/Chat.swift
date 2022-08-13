import SwiftUI
import GoogleSignIn


struct Chat: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    private let user = GIDSignIn.sharedInstance.currentUser

    var body: some View {
        VStack {
            Header()
            UserView()
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
    }
}
