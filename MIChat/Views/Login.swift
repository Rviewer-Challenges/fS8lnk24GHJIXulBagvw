import SwiftUI

struct LoginView: View {

  // 1
  @EnvironmentObject var viewModel: AuthenticationViewModel

  var body: some View {
    VStack {
      Image("header_image")
        .resizable()
        .aspectRatio(contentMode: .fit)

      Text("Welcome to Michat! 💬")
        .fontWeight(.black)
        .foregroundColor(Color(.systemIndigo))
        .font(.title)
        .multilineTextAlignment(.center)

      Text("Chat with people around the world 🌎")
        .fontWeight(.light)
        .multilineTextAlignment(.center)
        .padding()

      Spacer()

      GoogleSignInButton()
        .padding()
        .onTapGesture {
          viewModel.signIn()
        }
    }.padding(.top, -100)
  }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
