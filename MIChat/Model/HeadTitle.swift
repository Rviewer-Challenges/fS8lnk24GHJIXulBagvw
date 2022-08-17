import Foundation
import SwiftUI

struct HeadTitle {
    let title: String
    let subtitle: String
    let image: String
    let titleColor: Color
}

let emptyStateTitle = HeadTitle(title: "¡Ups! No hay mensajes", subtitle: "¡Anímate y escribe el primero!", image: "terraBW", titleColor: .gray)
let AppTitle = HeadTitle(title: "💬 Bienvenido a Michat!", subtitle: "Chatea con gente de todo el mundo 🌎", image: "terra", titleColor: .orange)



