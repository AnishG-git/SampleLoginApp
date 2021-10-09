import SwiftUI
import Firebase
import FirebaseAuth

struct ForgotPasswordView: View {
    @State var resetEmail = ""
    @State var resetPasswordErrorLabel = ""
    var body: some View {
        
        VStack {
        Text("Password Reset")
            .bold()
            .font(.title)
            .padding(.bottom, (UIScreen.main.bounds.width * 18) / 414)
            TextField("Email", text: $resetEmail)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(30)
                .padding(.bottom, (UIScreen.main.bounds.width * 18) / 414)
            Button(action: {
                if resetEmail == "" {
                    resetPasswordErrorLabel = "Please Fill Out the Text Field"
                } else {
                    Auth.auth().sendPasswordReset(withEmail: resetEmail) { (error) in
                        if error != nil {
                            resetPasswordErrorLabel = "There was an error"
                        } else {
                            resetPasswordErrorLabel = "successfully sent email"
                        }
                    }
                }
            }) {
                buttonWithBackground(btnText: "Send", color: lightblueColor)
            }
        
            .padding(.bottom, (UIScreen.main.bounds.width * 10) / 414)
            Text(resetPasswordErrorLabel)
            .padding(.bottom, (UIScreen.main.bounds.width * 200) / 414)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
