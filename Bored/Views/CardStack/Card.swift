import SwiftUI

struct Card: View {
    let colors = Colors() // Tornando Colors um enum com propriedades estáticas não precisaríamos dessa propriedade aqui
    let label: String
    let image: String
    // se o número de propriedades for crescer muito, vale a pena ter um struct para segurar os dados, por exemplo, CardViewModel, CardProperties, CardSettings

    var body: some View {
        VStack(alignment: .center, spacing: 4) { //  VStack(alignment: .center, spacing: Style.verticalSpacing)
            Image(image)
                .resizable()
                .frame(width: 142, height: 106)
            Text(label)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(colors.titleColor) // .foregroundStyle(Colors.titleColor)
        }
        .padding(EdgeInsets(top: 16, leading: 9, bottom: 40, trailing: 9))
        .background(colors.cardBackground) // .stroke(Colors.cardBackground, lineWidth: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(colors.cardBorder, lineWidth: 2) // .stroke(Colors.cardBorder, lineWidth: 2)
        )
    }
}

// DICA:
// Eu gosto de criar uma extension da View para colocar as constanstes, assim, evitando os números mágicos.
// Coloquei um exemplo para o espaço vertical da VStack mas serve para os outros números que estão soltos no body.

extension Card {

    enum Style {
        static let verticalSpacing: CGFloat = 4.0
    }
}

#Preview {
    Card(label: "Random", image: "random")
}