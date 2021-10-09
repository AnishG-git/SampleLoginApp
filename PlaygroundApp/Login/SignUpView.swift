import SwiftUI
import FirebaseAuth
import Firebase

struct SignUpView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var contactNo: String = ""
    @State var dob: String = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var isPresented = false
    @State var errorLabel = ""
    
    func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    func validateFields() -> String? {
        if firstName.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastName.trimmingCharacters(in: .whitespacesAndNewlines) == "" || email.trimmingCharacters(in: .whitespacesAndNewlines) == "" || contactNo.trimmingCharacters(in: .whitespacesAndNewlines) == "" || dob.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.trimmingCharacters(in: .whitespacesAndNewlines) == "" || confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines )
        if !isPasswordValid(trimmedPassword) {
            return "Make Sure Password has necessary characters"
        }
        return nil
    }
    var body: some View {
        VStack {
            VStack {
                Text(errorLabel)
                    .frame(height: 10, alignment: .center)
                //.padding(.bottom, 10)
            }
            VStack {
                
                HStack {
                    
                    
                    TextField("First Name", text: $firstName)
                        .frame(height: 25, alignment: .center)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .imageScale(.small)
                    
                    
                }
                seperator()
            }.padding(.bottom, (UIScreen.main.bounds.width * 25) / 414)
            
            VStack {
                HStack {
                    
                    
                    
                    TextField("Last Name", text: $lastName)
                        .frame(height: 25, alignment: .center)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .imageScale(.small)
                    
                }
                seperator()
                
            }.padding(.bottom, (UIScreen.main.bounds.width * 25) / 414)
            
            VStack {
                
                HStack {
                    
                    
                    TextField("Email", text: $email)
                        .frame(height: 25, alignment: .center)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .imageScale(.small)
                        .keyboardType(.emailAddress)
                        .autocapitalization(UITextAutocapitalizationType.none)
                    
                }
                seperator()
                
            }.padding(.bottom, (UIScreen.main.bounds.width * 25) / 414)
            
            VStack {
                
                HStack {
                    
                    
                    TextField("Contact Number", text: $contactNo)
                        .frame(height: 25, alignment: .center)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .imageScale(.small)
                        .keyboardType(.numberPad)
                    
                }
                seperator()
            }.padding(.bottom, (UIScreen.main.bounds.width * 25) / 414)
            
            VStack {
                
                ZStack {
                    HStack {
                        
                        
                        
                        TextField("Date of Birth", text: $dob)
                            .frame(height: 25, alignment: .center)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .imageScale(.small)
                        
                    }
                }
                seperator()
                
            }.padding(.bottom, (UIScreen.main.bounds.width * 25) / 414)
            
            VStack {
                
                HStack {
                    
                    
                    
                    SecureField("Password", text: $password)
                        .frame(height: 25, alignment: .center)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .imageScale(.small)
                    
                }
                seperator()
                
            }.padding(.bottom, (UIScreen.main.bounds.width * 25) / 414)
            
            VStack {
                
                HStack {
                    
                    
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .frame(height: 25, alignment: .center)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .imageScale(.small)
                    
                }
                seperator()
                
            }.padding(.bottom, (UIScreen.main.bounds.width * 60) / 414)
            
            VStack {
                Button(action: {
                    let error = self.validateFields()
                    if error != nil {
                        self.errorLabel = error!
                    } else {
                        let cleanFirstName = self.firstName.trimmingCharacters(in: .whitespacesAndNewlines)
                        let cleanLastName = self.lastName.trimmingCharacters(in: .whitespacesAndNewlines)
                        let cleanDob = self.dob.trimmingCharacters(in: .whitespacesAndNewlines)
                        let cleanContactNo = self.contactNo.trimmingCharacters(in: .whitespacesAndNewlines)
                        Auth.auth().createUser(withEmail: self.email, password: self.password) { (result, error) in
                            if error != nil {
                                print(error?.localizedDescription as Any)
                                self.errorLabel = "Error creating user. Please try again later."
                            } else {
                                
                                let db = Firestore.firestore()
                                db.collection("users").addDocument(data: ["firstName": cleanFirstName, "lastName": cleanLastName, "contactNumber": cleanContactNo, "dateOfBirth": cleanDob, "uid": result?.user.uid]) { (error) in
                                    if error != nil {
                                        self.errorLabel = "Error storing  user data"
                                    }
                                }
                                self.errorLabel = "Successfully created login"
                            }
                        }
                    }
                }) {
                    buttonWithBackground(btnText: "SIGN UP", color: lightGreenColor)
                }.padding(.bottom, (UIScreen.main.bounds.width * 65) / 414)
            }
        }
    }
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
}
