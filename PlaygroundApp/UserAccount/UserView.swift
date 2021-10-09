import SwiftUI
import Firebase
import FirebaseAuth

struct UserView: View {
    
    @State var show = false
    @State var logoutSelection: Int?
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        TabView {
            ZStack{
                
                NavigationView {
                    Text("")
                        .navigationBarTitle("Home",displayMode: .inline)
                        .navigationBarItems(
                            
                            leading:
                                
                                Image("bg")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            , trailing:
                                
                                Button(action: {
                                    
                                    withAnimation{
                                        
                                        self.show.toggle()
                                    }
                                    
                                }, label: {
                                    
                                    Image("menu")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                })
                        )
                }
                .navigationBarHidden(true)
                
                if self.show {
                    GeometryReader{_ in
                        withAnimation {
                            Menu()
                                .onTapGesture {
                                    withAnimation {
                                    self.show = false
                                    }
                                }
                            
                        }
                        
                        NavigationLink(destination: LoginView(), tag: 4, selection: $logoutSelection) {
                            Text("")
                        }
                        
                        
                    }
                    .padding(.leading, 63)
                    .padding(.top, 295)
                    .background(
                        
                        Color.black.opacity(0.65)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                
                                //withAnimation {
                                withAnimation {
                                    
                                    self.show.toggle()
                                }
                                //}
                            }
                        
                    )
                    
                }
                
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            Settings()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}



struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}

struct Menu : View {
    @AppStorage("log_Status") var logInStatus = false
    @State var alert = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body : some View {
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
                    do {
                        try Auth.auth().signOut()
                        withAnimation {
                        self.logInStatus = false
                        }
                    } catch let signOutError {
                        self.alert.toggle()
                        print(signOutError.localizedDescription)
                    }
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
        
        
        //
        //        VStack(alignment: .leading, spacing: 15) {
        //
        //            Button(action: {
        //
        //            }) {
        //
        //                HStack(spacing: 12){
        //
        //                    Image("Home").renderingMode(.original).resizable().frame(width: 30, height: 26)
        //
        //                    Text("Home").foregroundColor(.black)
        //                }
        //            }
        //
        //            Button(action: {
        //
        //            }) {
        //
        //                HStack(spacing: 12){
        //
        //                    Image("Profile").renderingMode(.original).resizable().frame(width: 30, height: 24).offset(x: -2)
        //
        //                    Text("Profile").foregroundColor(.black)
        //                }
        //            }
        //
        //            Button(action: {
        //
        //            }) {
        //
        //                HStack(spacing: 12){
        //
        //                    Image("Notification").renderingMode(.original).resizable().frame(width: 30, height: 28).offset(x: 2)
        //
        //                    Text("Notifications").foregroundColor(.black)
        //                }
        //            }
        //
        //            Button(action: {
        //
        //            }) {
        //
        //                HStack(spacing: 12){
        //
        //                    Image("Settings").renderingMode(.original).resizable().frame(width: 31, height: 26).offset(x: -2)
        //
        //                    Text("Settings").foregroundColor(.black)
        //                }
        //            }
        //
        //        }.padding()
        //        .background(Color.white)
        //        .cornerRadius(15)
    }
}
struct Dashboard {
    
}

