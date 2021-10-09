import SwiftUI
import Foundation
import FirebaseAuth
import Firebase

var userState = 0

struct LoginView: View {
    @AppStorage("log_Status") var logInStatus = false
    @State var email = ""
    @State var password = ""
    @State var showResetModal = false
    @Environment(\.presentationMode) private var isPresented
    @State private var showSignup = false
    @State private var selection: Int?
    @State private var showModal = false
    @State private var selectionLoggedIn: Int?
    @State var errorLabel = ""
    @State private var showPassword = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .soft)
    var body: some View {
        NavigationView {
            VStack {
                Text("Playground")
                    .font(.system(size: (UIScreen.main.bounds.width * 50) / 414, weight: .regular, design: .default))
                    .padding(.bottom, (UIScreen.main.bounds.width * 25) / 414)
                    .padding(.top, (UIScreen.main.bounds.width * 95) / 414)
                VStack {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .padding(.leading, (UIScreen.main.bounds.width * 18) / 414)
                    seperator()
                }.padding(.bottom, (UIScreen.main.bounds.width * 25) / 414)
                VStack {
                    ZStack {
                        HStack {
                            if self.showPassword {
                                TextField("Password", text: $password)
                                    .padding(.leading, (UIScreen.main.bounds.width * 18) / 414)
                            } else {
                                SecureField("Password", text: $password)
                                    .padding(.leading, (UIScreen.main.bounds.width * 18) / 414)
                                    .textContentType(.oneTimeCode)
                            }
                            Button(action: {
                                self.showPassword.toggle()
                            }) {
                                Image(self.showPassword ? "ic_eye_open": "ic_eye_closed")
                                    .foregroundColor(.black)
                                .padding(.trailing, (UIScreen.main.bounds.width * 35) / 414)
                            }
                        }
                    }
                    seperator()
                    Text("Forgot Password")
                    .padding()
                        .padding(.leading, 200)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            self.showResetModal = true
                        }.sheet(isPresented: $showResetModal, content: {
                            ForgotPasswordView()
                        })
                    Text(errorLabel)
                }.padding(.bottom, (UIScreen.main.bounds.width * 65) / 414)
                VStack {
                    Spacer()
                    NavigationLink(destination: UserView(), tag: 1, selection: self.$selectionLoggedIn) {
                        Text("")
                    }
                    Button(action: {
                        let loginEmail = self.email.trimmingCharacters(in: .whitespacesAndNewlines)
                        let loginPassword = self.password.trimmingCharacters(in: .whitespacesAndNewlines)
                        Auth.auth().signIn(withEmail: loginEmail, password: loginPassword) { (result, error) in
                            if error != nil {
                                self.errorLabel = "Username does not match password"
                            } else {
                                self.errorLabel = "Successfully logged in"
                                self.selectionLoggedIn = 1
                                self.email = ""
                                self.password = ""
                                withAnimation {
                                self.logInStatus = true
                                }
                            }
                        }
                    }) {
                        buttonWithBackground(btnText: "LOGIN", color: lightblueColor)
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    ZStack {
                        Button(action: {
                            self.selection = 1
                            self.showModal = true
                            self.hapticImpact.impactOccurred()
                        }) {
                            buttonWithBackground(btnText: "SIGN UP", color: lightGreenColor)
                        }.sheet(isPresented: self.$showModal) {
                            SignUpView()
                        }
                    }
                    Spacer(minLength: 300)
                }
            }
        }.navigationBarHidden(true)
    }
}
struct seperator: View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var body: some View {
        
        VStack {
            
            Divider().background(lightGreyColor)
            
        }.padding()
            .frame(height: 0.5, alignment: .center)
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
