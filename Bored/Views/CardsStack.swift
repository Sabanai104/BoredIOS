import SwiftUI

struct CardsStack: View {
    let items:[CardInfo]  = [
        CardInfo(label: "Random", image: "random"),
        CardInfo(label: "Education", image: "education"),
        CardInfo(label: "Recreational", image: "recreational"),
        CardInfo(label: "Social", image: "social"),
        CardInfo(label: "Cooking", image:"cooking"),
        CardInfo(label: "Charity", image: "charity"),
        CardInfo(label: "Do it yourself", image: "doYourself"),
        CardInfo(label: "Relaxation", image: "relaxation"),
        CardInfo(label: "Busy work", image: "busyWork"),
        CardInfo(label: "Music", image: "music")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24){
                VStack (alignment: .leading, spacing: 4){
                    Text("Are you bored yet? <3")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Colors().titleColor)

                    Text("If u are bored, press one of the activities options below.")
                        .font(.body)
                        .padding(.leading,2)
                        .foregroundStyle(Colors().bodyColor)
                }

                LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible())], spacing: 20) {
                    ForEach(items, id: \.self) { item in
                        Card(label: item.label, image: item.image)
                    }
                }
            }
            .padding(24)
        }
    }
}

#Preview {
    CardsStack()
}
