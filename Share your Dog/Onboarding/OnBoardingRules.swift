//
//  OnBoardingRules.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 08.05.23.
//
import SwiftUI
import Foundation

struct OnboardingRules: View {
    @EnvironmentObject var authService: AuthService
    @AppStorage("onBoarding") var onBoarding = true
    @State private var showLoginView = false
    @State private var restartOnboarding = false
    @State private var showProfileView = false

    var body: some View {
        VStack {
            if onBoarding {
                OnBoardingView()
                    .transition(.opacity.animation(.default))
            } else {
                Group {
                    if authService.user != nil {
                        ProfileView()
                    } else {
                        AfterOnBoarding()
                            .transition(.opacity.animation(.default))
                    }
                }
                .onAppear {
                    authService.listenToAuthState()
                }
            }
        }
    }

}
