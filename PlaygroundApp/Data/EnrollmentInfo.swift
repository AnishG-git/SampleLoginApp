import SwiftUI

struct StudentInfo: Identifiable, Decodable, Hashable {
    var id: Int
    var email: String
    var studentFirstName: String
    var studentLastName: String
    var school: String
    var gradeLevel: String
    var gender: String
    var parentFirstName: String
    var parentLastName: String
    var parentWorkNumber: String
    var emergencyContactName: String
    var emergencyContactPhone: String
    var team: String
}


struct EnrollmentInfo_Previews {
    
}
