//
//  ChatView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 11.05.23.
//
import SwiftUI
import UIKit

import SwiftUI
import UIKit

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var newMessage = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    @State private var isShowingEmojiPicker = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.messages) { message in
                            MessageView(message: message)
                        }
                    }
                }
                
                Divider()
                
                HStack {
                    Button(action: {
                        isShowingImagePicker = true
                    }) {
                        Image(systemName: "photo")
                    }
                    .padding()
                    .foregroundColor(.brown)
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                        ImagePicker(image: $selectedImage)
                    }
                    
                    Button(action: {
                        isShowingEmojiPicker = true
                    }) {
                        Image(systemName: "smiley")
                    }
                    .padding()
                    .foregroundColor(.brown)
                    .sheet(isPresented: $isShowingEmojiPicker) {
                        EmojiPicker(selectedEmoji: $newMessage)
                    }
                    
                    TextField("Nachricht eingeben", text: $newMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        sendMessage()
                    }) {
                        Text("Senden")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.brown)
                    .cornerRadius(10)
                }
                .padding()
            }
        }
    }
    
    func sendMessage() {
        guard !newMessage.isEmpty || selectedImage != nil else { return }
        viewModel.processUserMessage(message: newMessage, image: selectedImage)
        newMessage = ""
        selectedImage = nil
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        // Hier kannst du die ausgewählte Bildaktion ausführen
    }
}

struct MessageView: View {
    let message: Message
    
    var body: some View {
        VStack(alignment: message.sender == "User" ? .leading : .trailing) {
            if let image = message.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
            } else {
                Text(message.content)
                    .padding()
                    .background(message.sender == "User" ? Color.gray : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text(message.timestamp, style: .time)
                .font(.caption)
                .foregroundColor(.brown)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
