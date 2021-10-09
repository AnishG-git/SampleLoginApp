import SwiftUI

let lightblueColor = Color(red: 85.0/255.0, green: 84.0/255.0, blue: 166.0/255.0, opacity: 1.0)

let lightGreenColor = Color(red: 21.0/255.0, green: 183.0/255.0, blue: 177.0/255.0, opacity: 1.0)

struct LoginDesign: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct LoginDesign_Previews: PreviewProvider {
    static var previews: some View {
        LoginDesign()
    }
}

struct buttonWithBackground: View {
    
    var btnText: String
    
    var color: Color
    
    var body: some View {
        
        HStack {
            //            Spacer()
            Text(btnText)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 140, height: 50)
                .background(color)
                .clipped()
                .cornerRadius(5.0)
            //.shadow(color: color, radius: 5, x: 0, y: 5)
            
            //            Spacer()
        }
    }
}
