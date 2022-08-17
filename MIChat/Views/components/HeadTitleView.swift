import SwiftUI

struct HeadTitleView: View {
    let headTitle: HeadTitle

    var body: some View {
        Image(headTitle.image)
            .resizable()
            .frame(maxWidth: 100, maxHeight: 80)
            .aspectRatio(contentMode: .fill)

        Text(headTitle.title)
            .fontWeight(.black)
            .foregroundColor(headTitle.titleColor)
            .font(.title)
            .multilineTextAlignment(.center)

        Text(headTitle.subtitle)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
            .padding(.top, -10)
    }
}

struct HeadTitleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeadTitleView(headTitle: emptyStateTitle)
            HeadTitleView(headTitle: AppTitle)
        }

    }
}
