import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            Spacer(minLength: 200)
            HeadTitleView(headTitle: AppTitle)
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
