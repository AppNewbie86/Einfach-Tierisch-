//
//  CreateProfileView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//
import SwiftUI
import UIKit


class CreateProfileViewModel: NSObject, ObservableObject {
    @Published var selectedImage: UIImage?
    
    // Funktion zum Auswählen des Profilbildes
    func selectImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        // Prüfen, ob der UIImagePickerController verfügbar ist
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // Die View muss eine UIWindow-Instanz haben, um den UIImagePickerController präsentieren zu können
            if let window = UIApplication.shared.windows.first {
                window.rootViewController?.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
}

// Erweiterung des View-Modells für die UIImagePickerControllerDelegate-Methoden
extension CreateProfileViewModel: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Das ausgewählte Bild aus dem UIImagePickerController extrahieren
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.selectedImage = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

struct CreateProfileView: View {
    @StateObject private var viewModel = CreateProfileViewModel() // ViewModel initialisieren
    @State private var name: String = ""
    @State private var age: Int = 0
    @State private var address: String = ""
    @State private var postalCode: String = ""
    
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Create Profile")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding()
                
                VStack(spacing: 20) {
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .foregroundColor(.black)
                    }
                    
                    Text("Add Profile Picture")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Button(action: {
                        viewModel.selectImage()
                    }) {
                        Text("Upload Image")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.brown)
                            .cornerRadius(10)
                    }
                    
                    TextField("Name", text: $name)
                        .textFieldStyle(GrayTextFieldStyle())
                        .foregroundColor(Color.white)
                        .padding(.horizontal)

                    
                    TextField("Address", text: $address)
                        .textFieldStyle(GrayTextFieldStyle())
                        .foregroundColor(Color.white)
                        .frame(height: 60)
                        .padding(.horizontal)
                    
                    TextField("Postal Code", text: $postalCode)
                        .textFieldStyle(GrayTextFieldStyle())
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                    
                    Stepper(value: $age, in: 0...100, label: {
                        Text("Age: \(age)")
                            .foregroundColor(.black)
                    })
                    .padding(.horizontal)
                    .foregroundColor(.black)
                    .accentColor(.brown)
                }
                .padding()
            }
        }
    }
}


struct GrayTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(8)
            .padding(.horizontal)
            .foregroundColor(.black) // Textfarbe hinzugefügt
    }
}
