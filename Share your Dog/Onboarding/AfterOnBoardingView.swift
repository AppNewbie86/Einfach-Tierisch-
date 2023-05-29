//  AfterOnBoardingView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 08.05.23.
//
import SwiftUI
import SwiftUI

struct AfterOnBoarding: View {
    
    @AppStorage("onBoarding")  var onBoarding = false
    
    @State private var showLoginView = false
    @State private var RestartOnboarding = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @State private var imageRotation: Double = 0
    
    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("background3")
                .resizable()
                .opacity(0.55)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                HStack { // HStack mit dem Logo
                    Image("LogoLinks")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.leading, 32)
                        .padding(.top, 50)
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 100) // Abstand am oberen Rand
                
                // Begrüßungstext
                Text("Wuff")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 60, weight: .regular))
                    .foregroundColor(.white.opacity(1.00))
                    .padding()
                
                Text("schön\ndich hier zu treffen......")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.black.opacity(1.00))
                    .padding()
                
                Spacer()
                
                // Logo oder Bild
                Spacer()
                
                // Anmelde-Button
                Button(action: {
                    self.showLoginView = true
                }, label: {
                    Text("Zum Login")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                })
                .buttonStyle(BorderedProminentButtonStyle())
                .controlSize(.large)
                .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                .frame(maxWidth: .infinity)
                
                .shadow(radius: 10)
                .padding(.bottom, 100) // Abstand unten hinzufügen
                .sheet(isPresented: $showLoginView) {
                    LoginView()
                }
            }
        }
    }
}

struct AfterOnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        AfterOnBoarding()
    }
}
