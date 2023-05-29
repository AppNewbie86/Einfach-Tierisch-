//
//  EmojiPicker.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 29.05.23.
//

import Foundation
import SwiftUI


struct EmojiPicker: View {
    @Binding var selectedEmoji: String
    
    var body: some View {
        VStack {
            Text("Emoji Picker")
                .font(.headline)
                .padding()
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { index in
                        Button(action: {
                            selectedEmoji.append("😀")
                        }) {
                            Text("😀")
                                .font(.largeTitle)
                        }
                    }
                }
                .padding()
            }
            
            Button(action: {
                // Hier kannst du den Emoji-Picker schließen
            }) {
                Text("Fertig")
                    .font(.headline)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

// Beispiel Emoji-Sammlung
struct EmojiStore {
    static let emojis = ["😄", "😊", "👍", "🎉", "🥳", "❤️", "🌟"]
}
