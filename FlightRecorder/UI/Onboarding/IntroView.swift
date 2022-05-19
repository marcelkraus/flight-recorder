import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 32.0) {
            Text("Hallo, Flieger!")
                .font(.title)
            Text("Dies ist dein persönliches **Flugbuch**. Erfasse alle deine Drohnenflüge in dieser App und sei für alle behördlichen Auflagen bestens gerüstet.")
                .font(.body)
            Spacer()
            NavigationLink(destination: {
                PilotView()
            }, label: {
                Image(systemName: "arrow.forward.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48.0, height: 48.0, alignment: .center)
                    .imageScale(.large)
            })
        }
        .navigationTitle("Herzlich Willkommen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
