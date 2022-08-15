
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            UserView()
            Spacer()
        }.frame(maxHeight: .infinity)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthenticationViewModel())
    }
}
