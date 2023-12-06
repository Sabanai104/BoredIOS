import Foundation
import SwiftUI

// Colors poderia ser um enum ao invés de struct
// suas propriedades poderiam ser static let, por exemplo, static let cardBorder = ...
// dessa forma, facilita a forma que você acessa esses valores constantes
//
// Uso: Colors.cardBorder
struct Colors {
    let cardBorder = Color(red: 157/255, green: 222/255, blue: 211/255)
    let cardBackground = Color(red: 254/255, green: 254/255, blue: 254/255)
    let appBackground = Color(red: 249/255, green: 249/255, blue: 249/255)
    let titleColor = Color(red: 74/255, green: 74/255, blue: 74/255)
    let bodyColor = Color(red: 153/255, green: 153/255, blue: 153/255)
    let buttonColor = Color(red: 157/255, green: 222/255, blue: 211/255)
    let buttonLabelColor = Color(red: 19/255, green: 124/255, blue: 107/255)
}
