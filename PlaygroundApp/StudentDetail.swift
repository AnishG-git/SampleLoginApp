import SwiftUI

struct StudentDetail: View {
    var item: StudentInfo
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Gender:")
                        .bold()
                    Text("\(item.gender)")
                }
                HStack {
                    Text("Grade Level:")
                        .bold()
                    Text("\(item.gradeLevel)")
                }
                HStack {
                    Text("Email:")
                        .bold()
                    Text("\(item.email)")
                }
                HStack {
                    Text("Parent Name:")
                        .bold()
                    Text("\(item.parentFirstName) \(item.parentLastName)")
                }
                HStack {
                    Text("Emergency Contact Name:")
                        .bold()
                    Text("\(item.emergencyContactName)")
                }
                HStack {
                    Text("Emergency Contact:")
                        .bold()
                    Text("\(item.emergencyContactPhone)")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            let tel = "tel://"
                            let formattedString = tel + self.item.emergencyContactPhone
                            let url: NSURL = URL(string: formattedString)! as NSURL
                            UIApplication.shared.open(url as URL)
                    }
                }
                HStack {
                    Text("Team:")
                        .bold()
                    Text("\(item.team)")
                }
            }
            Spacer()
        }
    }
}

struct StudentDetail_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetail(item: dataArray[0])
    }
}
