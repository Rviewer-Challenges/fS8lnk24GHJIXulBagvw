import SwiftUI

struct Input: View {
    @State private var username: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField( "   What you gonna share?",
                           text: $username)
                .padding(4)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2)
                )
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(.white)

            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.orange)
        }
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        Input()
    }
}
