import SwiftUI

struct ActivityDetails: View {
    @StateObject private var viewModel = ViewModel()
    let activityType: String
    let colors = Colors()

    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            let image = ActivityDetail().returnImage(activityTipe: activityType)


            Image(image)
                .resizable()
                .frame(width: 241, height: 123)
                .redacted(reason: viewModel.boredAPI == nil ? .placeholder : .invalidated)
                .cornerRadius(8)

            VStack(alignment: .center, spacing: 56) {
                VStack(alignment: .center, spacing: 24) {
                    Text("Here is your \(activityType) activity ❤")
                        .foregroundStyle(colors.titleColor)
                        .fontWeight(.semibold)
                        .font(.title3)
                        .redacted(reason: viewModel.boredAPI == nil ? .placeholder : .invalidated)


                    Text(viewModel.boredAPI?.activity ?? "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + ".")
                        .foregroundStyle(colors.bodyColor)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .redacted(reason: viewModel.boredAPI == nil ? .placeholder : .invalidated)

                }

                Button(action: {
                    if viewModel.boredAPI != nil {
                        viewModel.fetch(type: activityType)
                    }
                }, label: {
                        Text("Gerar novamente!")
                    })
                .font(.callout)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(colors.buttonColor)
                .foregroundColor(colors.buttonLabelColor)
                .cornerRadius(8)
                .redacted(reason: viewModel.boredAPI == nil ? .placeholder : .invalidated)
            }
        }
        .padding()
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            Text("Feito com amor por Sabanai ❤")
                .foregroundStyle(Colors().bodyColor)
        }
        .onAppear{
            viewModel.fetch(type: activityType)
        }
    }
}

#Preview {
    ActivityDetails(
        activityType: "charity"
    )
}
