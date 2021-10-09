import SwiftUI
import Firebase
import FirebaseAuth

struct UserAccountView: View {
    @State var showMenu = false
    @State var alert = false
    @State private var selectionSignOut: Int?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text(". . .")
                        .zIndex(3.0)
                        .padding(.trailing, 34)
                        .padding(.top, 10)
                        .font(.headline)
                        .onTapGesture {
                            withAnimation {
                                self.showMenu = true
                            }
                        }
                }
            }
            Spacer()
            if self.showMenu {
                DropDown()
                Color.black.opacity(0.645)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }
            }
            NavigationView {
                Text("fjklsdjfkl")
            }
            .navigationBarTitle("hidden")
            .navigationBarHidden(true)
            
            /*
             VStack {
             Text("Sign Out")
             //.hidden()
             .foregroundColor(.blue)
             //                        .padding(.leading, (UIScreen.main.bounds.width * 250) / 414)
             //                        .padding(.top, (UIScreen.main.bounds.width * 10) / 414)
             .onTapGesture {
             self.presentationMode.wrappedValue.dismiss()
             //self.selectionSignOut = 1
             do {
             try Auth.auth().signOut()
             } catch let signOutError {
             self.alert.toggle()
             print(signOutError.localizedDescription)
             }
             }.alert(isPresented: $alert) {
             Alert(title: Text("Sign Out Error"), message: Text(""), dismissButton: .default(Text("OK")))
             }
             }
             //Spacer()
             */
        }
        // .navigationBarTitle(Text(""))
        //  .navigationBarHidden(true)
    }
}
// }
struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountView()
    }
}
/*
 Text("Log Out")
 //.hidden()
 .foregroundColor(.black)
 .onTapGesture {
 self.presentationMode.wrappedValue.dismiss()
 //self.selectionSignOut = 1
 do {
 try Auth.auth().signOut()
 } catch let signOutError {
 self.alert.toggle()
 print(signOutError.localizedDescription)
 }
 }.alert(isPresented: $alert) {
 Alert(title: Text("Sign Out Error"), message: Text(""), dismissButton: .default(Text("OK")))
 }
 */
struct DropDown: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 15) {
                Button(action: {
                }) {
                    HStack(spacing: 12) {
                        Text("Edit")
                            .foregroundColor(.green)
                            .font(.title2)
                            .bold()
                    }
                }
                Divider()
                    .frame(width: 240)
                
                Button(action: {
                }) {
                    HStack(spacing: 12) {
                        Text("Log Out")
                            .foregroundColor(.red)
                            .font(.title2)
                            .bold()
                            .padding(.top, 3)
                    }
                }
            }
            .padding(25)
            .background(Color.white)
            .cornerRadius(15)
            .zIndex(2)
        }
    }
}
