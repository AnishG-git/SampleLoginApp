import SwiftUI
import Firebase
import FirebaseStorage

struct EditView: View {
    @State private var image: Image?
    @State var n = 1
    @State var title = ""
    @State var imagePicker = false
    @State var imgData : Data = Data(count: 0)
    @State var inputImage: UIImage?
    @State var uploadErrorMessage: String?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            List(0..<n) { item in
                VStack {
                    HStack {
                        Text("Title:")
                            .bold()
                        TextField("Title", text: $title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(4)
                            .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width)/1.1, height: (UIScreen.main.bounds.width)/2, alignment: .leading)
                            .foregroundColor(.gray)
                        if image != nil {
                            image?
                                .resizable()
                                .scaledToFill()
                        } else {
                            Text("Tap to Select Video")
                                .foregroundColor(.white)
                        }
                    }
                    .onTapGesture {
                        self.imagePicker = true
                    }
                    Button(action: {
                        if inputImage == nil {
                            print("INPUT IMAGE IS NIL")
                        }
                        if let chosenImage = inputImage {
                            uploadImage(image: chosenImage)
                        }
                    }, label: {
                        Text("Upload Video")
                            .padding(10)
                            .background(Color(.green))
                            .cornerRadius(15)
                            .font(.caption)
                            .shadow(radius: 5)
                            .frame(alignment: .leading)
                    })
                    Text(uploadErrorMessage ?? "")
                }
            }
            HStack {
                Button(action: {
                    n -= 1
                }, label: {
                    Text("-")
                        .frame(width: 50, height: 30)
                        .cornerRadius(15)
                        .background(Color(.red))
                        .foregroundColor(.black)
                })
                .cornerRadius(5)
                .padding(.trailing, UIScreen.main.bounds.width/3.5)
                Button(action: {
                    n += 1
                }, label: {
                    Text("+")
                        .frame(width: 50, height: 30)
                        .cornerRadius(15)
                        .background(Color(.green))
                        .foregroundColor(.black)
                })
                .cornerRadius(5)
            }
            Spacer()
        }
        .sheet(isPresented: $imagePicker, onDismiss: loadImage) {
            //Present image picker
            ImagePicker(image: $inputImage)
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
    func uploadImage(image: UIImage) {
        if let inputData = image.jpegData(compressionQuality: 0.35) {
            let storage = Storage.storage()
            storage.reference().child("temp").putData((inputData), metadata: nil) { (_, err) in
                if err != nil {
                    uploadErrorMessage = "Error uploading video"
                } else {
                    uploadErrorMessage = "success"
                }
            }
        }
    }
}
    struct EditView_Previews: PreviewProvider {
        static var previews: some View {
            EditView()
        }
    }
    
    struct ImagePicker: UIViewControllerRepresentable {
        
        class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            let parent: ImagePicker
            init(_ parent: ImagePicker) {
                self.parent = parent
            }
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let uiImage = info[.originalImage] as? UIImage {
                    parent.image = uiImage
                }
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
        
        @Environment(\.presentationMode) var presentationMode
        @Binding var image: UIImage?
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            let picker = UIImagePickerController()
            //picker.mediaTypes = ["public.movie"]
            picker.delegate = context.coordinator
            return picker
        }
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
            
        }
    }

//struct EditView: View {
//    var n = 0
//    var body: some View {
//        VStack {
//            List(0..<n) { item in
//                VStack {
//                Text("Title")
//                    Button(action: {
//
//                    }, label: {
//                        Text("Upload Video")
//                            .padding(20)
//                            .background(lightGreenColor)
//                            .cornerRadius(15)
//                    })
//                }
//            }
//        }
//    }
//}
//
//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
