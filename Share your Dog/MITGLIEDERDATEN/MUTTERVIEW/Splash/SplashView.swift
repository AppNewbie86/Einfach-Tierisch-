//
//  SplashView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 08.05.23.
//
import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @Binding var searchText: String

    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.brown.opacity(0.25), .brown.opacity(0.75)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .foregroundColor(.brown)
                        .scaleEffect(isActive ? 1.2 : 0.6)
                        .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                withAnimation {
                                    self.isActive = true
                                }
                            }
                        }

                    Text("Einfach Tierisch ....")
                        .foregroundColor(.brown)
                        .font(.title)
                        .bold()
                        .padding(.all)
                    
                    Spacer()
                }
            }
        }
    }
}

