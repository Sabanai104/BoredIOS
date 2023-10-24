import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Colors().appBackground
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        CardsStack()
                })
        }
    }
}

#Preview {
    ContentView()
}
