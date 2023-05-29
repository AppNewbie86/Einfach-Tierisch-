//
//  Message.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import Foundation
import SwiftUI


struct Message: Identifiable {
    let id: UUID
    let sender: String
    let content: String
    let timestamp: Date
    let image: UIImage? // Optional image property
}
