import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @EnvironmentObject var firestoreManager: FirestoreManager

    var body: some View {
        NavigationView {
            VStack{
                switch viewModel.state {
                     case .signedIn: ChatView()
                     case .signedOut: LoginView()
                   }
            }.navigationTitle("💬 MICHAT")
                .navigationBarTitleDisplayMode(.inline)
                .accessibilityIdentifier("app title")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(FirestoreManager())
    }
}
