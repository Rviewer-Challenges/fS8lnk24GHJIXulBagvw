import SwiftUI
import GoogleSignIn

struct UserView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    private let user = GIDSignIn.sharedInstance.currentUser

    var body: some View {
        HStack(spacing: 90){
            HStack {
                NetworkImage(url: user?.profile?.imageURL(withDimension: 50))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(50)
                Text(user?.profile?.name ?? "Fulanito de tal")
                    .font(.headline)
            }
            Button(action: viewModel.signOut){Text("Sign out")}
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
            .environmentObject(AuthenticationViewModel())
    }
}


