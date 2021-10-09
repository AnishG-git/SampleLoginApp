import SwiftUI

struct MyAccountView: View {
    var body: some View {
        VStack {
            HStack {
        Text("Name:")
            .font(.headline)
            }
            .padding(.bottom, 10)
            HStack {
        Text("Email:")
            .font(.headline)
            }
            .padding(.bottom, 10)
            HStack {
        Text("Number:")
            .font(.headline)
            }
        }
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}
