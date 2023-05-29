//
//  Chat.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import Foundation


struct Chat : Identifiable, Hashable {
    let id = UUID()
    let number: Int
    let message: String
    let response: String
}
