import SwiftUI
import Firebase

@main
struct MIChatApp: App {

    @StateObject var viewModel = AuthenticationViewModel()
    @StateObject var firestoreManager = FirestoreManager()

    init() {
        setupAuthentication()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(firestoreManager)
        }
    }
}

extension MIChatApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}
