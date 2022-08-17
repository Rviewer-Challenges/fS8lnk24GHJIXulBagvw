import Foundation
import SwiftUI

protocol Options {
    var opacity: Double {get}
    var name: String {get set}
    var paddingName: CGFloat {get}
    var rounderCorners: UIRectCorner {get}
}

struct Mine: Options {
    var opacity: Double = 0.9
    var name: String = ""
    var paddingName: CGFloat = -20
    var rounderCorners: UIRectCorner = [.topLeft, .bottomLeft, .topRight]
}

struct Other: Options {
    var opacity: Double = 0.3
    var name: String
    var paddingName: CGFloat = 0
    var rounderCorners: UIRectCorner = [.topLeft, .bottomRight, .topRight]
}
