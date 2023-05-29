//
//  ChatViewModel.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 11.05.23.
//


import SwiftUI
import Foundation
import Combine
@MainActor
class ChatViewModel: ObservableObject {

@Published var messages: [Message] = []
@Published var contactList: [Contact] = []

init() {
    // Initialize any required data or dependencies
}

func getChatIndex(message: Message) -> Int {
    for index in messages.indices {
        if messages[index].id == message.id {
            return index
        }
    }
    return 0
}

func getChatIndex(id: UUID) -> Int {
    for index in messages.indices {
        if messages[index].id == id {
            return index
        }
    }
    return 0
}

func getContactIndex(contact: Contact) -> Int? {
    for index in contactList.indices {
        if contactList[index].id == contact.id {
            return index
        }
    }
    return nil
}

func updateContact(contact: Contact) {
    guard let index = getContactIndex(contact: contact) else {
        return
    }
    
    contactList[index] = contact
}

    func processUserMessage(message: String, image: UIImage? = nil) {
        let fakeResponse = generateFakeResponse(for: message)
        
        if let image = image {
            let messageWithImage = Message(id: UUID(), sender: "User", content: "", timestamp: Date(), image: image)
            messages.append(messageWithImage)
        } else {
            let messageWithoutImage = Message(id: UUID(), sender: "User", content: message, timestamp: Date(), image: nil)
            messages.append(messageWithoutImage)
        }
        
        let responseMessage = Message(id: UUID(), sender: "Bot", content: fakeResponse, timestamp: Date(), image: nil)
        messages.append(responseMessage)
    }



func generateFakeResponse(for message: String) -> String {
    let fakeResponses = ["Das klingt interessant!", "Ich verstehe. Weiter.", "Erzähl mir mehr!", "Das ist faszinierend!"]
    let randomIndex = Int.random(in: 0..<fakeResponses.count)
    return fakeResponses[randomIndex]
}
}
