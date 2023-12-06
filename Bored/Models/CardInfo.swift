import Foundation

// Renomear para ActivityCategory ou ActivityType
struct CardInfo: Identifiable, Hashable {
    var id = UUID() // Por uma questão de performance do SwiftUI, se houver um ID melhor, seria bom atribuir ele aqui, uma atividade possui um ID? 

    let label: String
    let image: String
    let activityType: String
}
