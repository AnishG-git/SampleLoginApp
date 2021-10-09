import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                        NavigationLink(
                            destination: MyAccountView(),
                            label: {
                                HStack {
                                Image(systemName: "person.circle")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 5)
                                Text("My Account")
                                    .foregroundColor(.black)
                                }
                            })
                    }
                Section {
                    NavigationLink(
                        destination: PersonalizationView(),
                        label: {
                            HStack {
                            Image(systemName: "person.circle.fill")
                                .foregroundColor(.black)
                                .padding(.trailing, 5)
                            Text("Personalization")
                                .foregroundColor(.black)
                            }
                        })
                }
                Section {
                    HStack {
                        Text("Log Out")
                            .foregroundColor(.red)
                            
                    }
                }.onTapGesture {
                    //log out
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Image("bg")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
            )
        }.navigationBarHidden(true)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
