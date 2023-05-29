//
//  AddPostView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import SwiftUI


struct AddPostView: View {
    @ObservedObject var viewModel: NewsViewModel
    @State private var title = ""
    @State private var content = ""
    @State private var description = ""

    @State private var image: UIImage? = nil
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            Text("Thema wählen")
                .font(.title)
                .padding()
            
            TextField("Titel", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Description", text: $description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextEditor(text: $content)
                .frame(height: 200)
                .padding()
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            
            Button(action: {
                showImagePicker = true
            }) {
                Text("Bild auswählen")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                viewModel.addPost(Post(title: title, content: content, image: image))
            }) {
                Text("Erstellen")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(image: $image)
        }
    }
}
