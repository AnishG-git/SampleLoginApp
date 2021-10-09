import SwiftUI

struct ContentView: View {
    @State var arrayData = ["d", "g"]
    @State var searchTerm = ""
    
    var body: some View {
            NavigationView {
                VStack {
                    SearchView(textSearched: $searchTerm)
                    List(dataArray.filter({ (studentInfo) -> Bool in
                        let fullNameAndTeam = "\(studentInfo.studentFirstName) \(studentInfo.studentLastName) \(studentInfo.team)"
                        if searchTerm.count > 0 {
                            return fullNameAndTeam.localizedCaseInsensitiveContains(searchTerm)
                        } else {
                            return true
                        }
                    })) { item in
                        NavigationLink(destination: StudentDetail(item: item)) {
                            VStack(alignment: .leading, spacing: 0) {
                            Text("\(item.studentFirstName) \(item.studentLastName)")
                                .fontWeight(.medium)
                            Text("\(item.team)")
                                //.fontWeight(.light)
                                .foregroundColor(.gray)
                            }
                        }
                    }
                    .navigationBarTitle(Text("Student Name"))
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

