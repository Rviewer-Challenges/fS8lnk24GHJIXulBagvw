import SwiftUI

struct ProfileButtonView: View {
    var body: some View {
            NavigationLink(
                destination: ProfileView()){
                    IconView(icon: "person.fill", color: .white)
            }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtonView()
    }
}
