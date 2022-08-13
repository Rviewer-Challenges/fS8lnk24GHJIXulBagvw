import SwiftUI

struct Header: View {
    var body: some View {
        VStack {

            VStack {
                Spacer()
                Text("💬 MICHAT")
                    .padding(.bottom, 8)
                    .font(.system(size: 25))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.orange)
        }

    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
