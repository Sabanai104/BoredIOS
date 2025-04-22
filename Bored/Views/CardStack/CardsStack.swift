import SwiftUI

struct CardsStack: View {
    let items:[CardInfo]  = [
        CardInfo(label: "Random", image: "random", activityType: "random"),
        CardInfo(label: "Education", image: "education", activityType: "education"),
        CardInfo(label: "Recreational", image: "recreational", activityType: "recreational"),
        CardInfo(label: "Social", image: "social", activityType: "social"),
        CardInfo(label: "Cooking", image:"cooking", activityType: "cooking"),
        CardInfo(label: "Charity", image: "charity", activityType: "charity"),
        CardInfo(label: "Do it yourself", image: "doYourself", activityType: "diy"),
        CardInfo(label: "Relaxation", image: "relaxation", activityType: "relaxation"),
        CardInfo(label: "Busy work", image: "busyWork", activityType: "busywork"),
        CardInfo(label: "Music", image: "music", activityType: "music")
    ]

    func activityDetails(activityType: String) -> ActivityDetails {
        return BoredFactory().make(activityType: activityType)
    }

    var body: some View {
        NavigationView{
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
                            NavigationLink{
                                activityDetails(activityType: item.activityType)
                            } label: {
                                Card(label: item.label, image: item.image)
                            }
                        }
                    }
                    HStack (alignment: .center){
                        Text("Feito com amor por Sabanai ❤")
                            .foregroundStyle(Colors().bodyColor)
                    }
                    .frame(maxWidth: .infinity)

                }
                .padding(24)
            }
        }
    }
}

//#Preview {
//    CardsStack()
//}
