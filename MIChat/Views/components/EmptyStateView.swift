
import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image("terra")
              .resizable()
              .frame(maxWidth: 100, maxHeight: 80)
              .aspectRatio(contentMode: .fill)

            Text("¡Ups! No hay mensajes")
              .fontWeight(.black)
              .foregroundColor(.gray)
              .font(.title)
              .multilineTextAlignment(.center)

            Text("¡Anímate y escribe el primero!")
              .fontWeight(.light)
              .multilineTextAlignment(.center)
              .padding(.top, -10)
        }

    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
