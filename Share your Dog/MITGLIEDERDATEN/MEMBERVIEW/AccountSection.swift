//
//  AccountSection.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 29.05.23.
//

import SwiftUI


struct AccountSection: View {
    let user: User
    
    var body: some View {
        VStack {
            Text("ID: \(user.id)")
            Text("Fullname: \(user.fullname)")
            Text("Age: \(user.age)")
            Text("Email: \(user.email)")
            Text("Username: \(user.userName)")
        }
    }
}
