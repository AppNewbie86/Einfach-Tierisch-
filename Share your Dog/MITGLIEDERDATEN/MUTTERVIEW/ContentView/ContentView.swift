//
//  ContentView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 05.05.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService : AuthService

  


    var body: some View {
        NavigationStack {
            
            
            ZStack {
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.brown,.brown,.brown], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    OnboardingRules()
                }
            }
        }
    }
}
    

