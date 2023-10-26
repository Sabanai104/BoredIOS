import SwiftUI

struct Card: View {
    let colors = Colors()
    let label: String
    let image: String

    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 4) {
            Image(image)
                .resizable()
                .frame(width: 142, height: 106)
            Text(label)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(colors.titleColor)
        }
        .padding(EdgeInsets(top: 16, leading: 9, bottom: 40, trailing: 9))
        .background(colors.cardBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(colors.cardBorder, lineWidth: 2)
        )
    }
}

#Preview {
    Card(label: "Random", image: "random")
}
