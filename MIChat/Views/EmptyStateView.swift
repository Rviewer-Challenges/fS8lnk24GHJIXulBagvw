
import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            HeadTitleView(headTitle: emptyStateTitle)
        }

    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
