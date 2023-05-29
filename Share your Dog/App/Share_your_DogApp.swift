//
//  Share_your_DogApp.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 05.05.23.
//

import SwiftUI
import Firebase
import FirebaseCore



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
@main
struct Share_your_DogApp: App {
    @StateObject var authService = AuthService()
    @StateObject private var shopViewModel = ShopViewModel()
    @State private var searchText = ""

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            SplashView(searchText: $searchText)
                .environmentObject(authService)
                .environmentObject(shopViewModel)
        }
    }
}
