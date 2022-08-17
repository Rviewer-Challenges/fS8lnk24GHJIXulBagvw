import SwiftUI

struct LoginView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel

  var body: some View {
    VStack {
        Spacer(minLength: 200)
      Image("terra")
        .resizable()
        .frame(maxWidth: 100, maxHeight: 80)
        .aspectRatio(contentMode: .fill)

      Text("💬 Welcome to Michat!")
        .fontWeight(.black)
        .foregroundColor(.orange)
        .font(.title)
        .multilineTextAlignment(.center)

      Text("Chat with people around the world 🌎")
        .fontWeight(.light)
        .multilineTextAlignment(.center)
        .padding(.top, -10)

      GoogleSignInButton()
        .padding()
        .onTapGesture {
          viewModel.signIn()
        }.padding(.top, -10)


    }.frame(maxHeight: .infinity)

  }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationViewModel())
    }
}
