//
//  TassoRegistrationView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 23.05.23.
//

import SwiftUI

struct TassoRegistrationView: View {
    
    // Constant Url as String
    let tassoURL = URL(string: "https://www.tasso.net")!
    
    var body: some View {
        ZStack {
            // Gradient Background with brown Colors
            LinearGradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Registrieren Sie Ihr Haustier jetzt bei Tasso.net")
                    .font(.title)
                    .padding()
                // Button with Function Call with open Website
                Button(action: {
                    openTassoWebsite()
                }) {
                    Text("Zu Tasso.net")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(12)
                }
            }
        }
    } // Ende Body
    
    // Function for open Website
        func openTassoWebsite() {
            if UIApplication.shared.canOpenURL(tassoURL) {
                UIApplication.shared.open(tassoURL)
            }
        }
    }

// Preview

struct TassoRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        TassoRegistrationView()
    }
}
