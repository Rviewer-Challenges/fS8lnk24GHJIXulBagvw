import Foundation
import SwiftUI

struct HeadTitle {
    let title: String
    let subtitle: String
    let image: String
    let titleColor: Color
}

let emptyStateTitle = HeadTitle(title: "¡Ups! No hay mensajes", subtitle: "¡Anímate y escribe el primero!", image: "terraBW", titleColor: .gray)
let AppTitle = HeadTitle(title: "💬 Welcome to Michat!", subtitle: "Chat with people around the world 🌎", image: "terra", titleColor: .orange)



