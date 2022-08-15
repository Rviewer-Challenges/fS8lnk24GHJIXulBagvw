import SwiftUI

struct IconView: View {

    private var icon: String
    private var height: CGFloat
    private var padding: CGFloat
    private var color: Color

    init(icon: String, color: Color = .black, height: Int = 25, padding: Int = 8) {
        self.icon = icon
        self.height =  CGFloat(height)
        self.padding = CGFloat(padding)
        self.color = color
    }

    var body: some View {
        Image(systemName: icon).resizable()
        .scaledToFit()
        .frame(height: height)
        .foregroundColor(color)
        .padding(.bottom, padding)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(icon: "gearshape.fill")
    }
}
