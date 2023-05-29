//
//  User.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 08.05.23.
//

import Foundation

// User Model with 3 Attributs

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let age: Int
    let email: String
    let userName: String
    
    // gibt die Initialien of the Fullname back and validiert the name of the correctly Formation of fullname
    
    var initials : String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return "" // return a blank String
    }
}

// Erweiterung der Klasse User mir Beispiel InitialisierungsDaten

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Kurt Meissner", age: 34, email: "kurtchenMeissner@web.de", userName: "testUser")
}
