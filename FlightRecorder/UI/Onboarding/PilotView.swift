import SwiftUI

struct PilotView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 32.0) {
            Text("TODO")
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
        .navigationTitle("Erstelle deinen Piloten")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PilotView_Previews: PreviewProvider {
    static var previews: some View {
        PilotView()
    }
}
