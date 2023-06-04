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
           
                VStack {
                    
                    Text("Tierisch Gut")
                        .foregroundColor(.white)
                        .font(.custom("Playfairdisplay-Bold", size: 40))
                        .bold()
                        .padding(.all)
                    Text("MY DOGGY\n ORGANIZER")
                        .foregroundColor(.white)
                        .font(.custom("Playfairdisplay-Bold", size: 60))
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.all)
                    
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

                   
                    Spacer()
                }
                .background(
                    Image("background3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
    }


