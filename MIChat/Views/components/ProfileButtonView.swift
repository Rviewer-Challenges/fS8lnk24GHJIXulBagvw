import SwiftUI

struct ProfileButtonView: View {
    var body: some View {
            NavigationLink(
                destination: ProfileView()){
                    IconView(icon: "person.fill", color: .white,  height: 20, padding: 0)
                }.accessibility(label: Text("Profile Button"))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtonView()
    }
}
