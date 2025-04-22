import SwiftUI

struct ActivityDetails: View {
    @ObservedObject var viewState: ViewState
    var viewModel: ViewModel
    let activityType: String
    let colors = Colors()
    var validate: String {
        activityType == "random" || activityType == "diy" ? "recreational" : activityType
    }

    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            let image = viewModel.returnImage(activityTipe: validate)
            Image(image)
                .resizable()
                .frame(width: 241, height: 123)
                .redacted(reason: viewState.boredInfo == nil ? .placeholder : .invalidated)
                .cornerRadius(8)

            VStack(alignment: .center, spacing: 56) {
                VStack(alignment: .center, spacing: 24) {
                    Text("Here is your \(activityType) activity ❤")
                        .foregroundStyle(colors.bodyColor)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .redacted(reason: viewState.boredInfo == nil ? .placeholder : .invalidated)


                    Text(viewState.boredInfo?.activity ?? "")
                        .foregroundStyle(colors.titleColor)
                        .fontWeight(.semibold)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .redacted(reason: viewState.boredInfo == nil ? .placeholder : .invalidated)
                }

                Button(action: {
                    if viewState.boredInfo != nil {
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
                .redacted(reason: viewState.boredInfo == nil ? .placeholder : .invalidated)
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

//#Preview {
//    ActivityDetails(
//        activityType: "charity"
//    )
//}
