//
//  HomeView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 05.05.23.
//
import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTY

    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    
    @State private var isAnimating: Bool = false
    @State private var showWelcomeView = false

    // MARK: - BODY

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // MARK: - HEADER
                Spacer()
                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("pic2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            Animation.easeInOut(duration: 4)
                                .repeatForever(),
                            value: isAnimating
                        )
                }
                // MARK: - CENTER
                Text("I know we all think we're immortal.")
                    .font(.headline)
                    .foregroundColor(Color("Weiß"))
                    .opacity(0.55)
                    .multilineTextAlignment(.leading)
                Text("So should we, because we are starting a new life.")
                    .font(.subheadline)
                    .foregroundColor(Color("Weiß"))
                    .opacity(0.55)
                    .multilineTextAlignment(.leading)
                Text("But whatever our short years in this world may be, our life becomes precious precisely because it doesn't last forever.")
                    .font(.subheadline)
                    .foregroundColor(Color("Weiß"))
                    .opacity(0.55)
                    .multilineTextAlignment(.leading)
                Text("It becomes precious because it has an end.")
                    .font(.subheadline)
                    .foregroundColor(Color("Weiß"))
                    .opacity(0.55)
                    .multilineTextAlignment(.leading)
                    .padding()
                Text("I understand that better than ever.")
                    .font(.subheadline)
                    .foregroundColor(Color("Weiß"))
                    .opacity(0.55)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                // MARK: - FOOTER
                Spacer()
                HStack {
                    Button(action: {
                        withAnimation {
                           // playSound(sound: "success", type: "m4a")
                            isOnBoardingViewActive = true
                        }
                    }) {
                        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                            .imageScale(.large)
                        Text("Restart")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    

                } //: HSTACK
            } //: VSTACK
            .onAppear(perform: {
                // Läuft im Main Thread und 3 Sekunden später
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    isAnimating = true
                }
            }) // Verst. die Navigationsleiste
            .navigationBarHidden(true)
            .background(Color.brown)

        } //: NAVIGATIONVIEW
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
