import SwiftUI
import Firebase

@main
struct MIChatApp: App {

    @StateObject var viewModel = AuthenticationViewModel()

    init() {
      setupAuthentication()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

extension MIChatApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
