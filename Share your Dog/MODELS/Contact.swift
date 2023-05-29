//
//  Contact.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 11.05.23.
//

import Foundation
import SwiftUI

struct Contact : Identifiable, Hashable {
    var id = UUID()
    let name: String
    let image: String
    let messageTitle: String
    let phoneNumber: String
    let email: String
}



