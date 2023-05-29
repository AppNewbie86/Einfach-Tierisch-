//
//  ChatView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 11.05.23.
//

import SwiftUI
import Foundation
import Combine

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var newMessage = ""
    
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
                
                HStack {
                    TextField("Nachricht eingeben", text: $newMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Senden") {
                        sendMessage()
                    }
                    .background(Color.brown)
                    .foregroundColor(.white)
                }
                .padding()
            }
            .navigationTitle("Chat")
        }
    }
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        viewModel.processUserMessage(message: newMessage)
        newMessage = ""
    }
}

struct MessageView: View {
    let message: Message
    
    var body: some View {
        VStack(alignment: message.sender == "User" ? .leading : .trailing) {
            Text(message.content)
                .padding()
                .background(message.sender == "User" ? Color.gray : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            
            Text(message.timestamp, style: .time)
                .font(.caption)
                .foregroundColor(.brown)
        }
    }
}
