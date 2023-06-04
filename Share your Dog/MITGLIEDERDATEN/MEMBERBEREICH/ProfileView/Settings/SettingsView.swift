//
//  SettingsView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//
import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel() // ViewModel initialisieren

    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding()
                
                Form {
                                    Section(header: Text("Account")) {
                                        VStack(alignment: .leading) {
                                            Text("Username")
                                                .foregroundColor(.gray)
                                            TextField("Enter username", text: $viewModel.username)
                                                .font(.body)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("Email")
                                                .foregroundColor(.gray)
                                            TextField("Enter email", text: $viewModel.email)
                                                .font(.body)
                                        }
                                    }
                                    
                                    Section(header: Text("Notifications")) {
                                        Toggle(isOn: $viewModel.pushNotificationsEnabled) {
                                            Text("Push Notifications")
                                        }
                                        
                                        Toggle(isOn: $viewModel.emailNotificationsEnabled) {
                                            Text("Email Notifications")
                                        }
                                    }
                                    
                                    Section(header: Text("Privacy")) {
                                        Toggle(isOn: $viewModel.publicProfileEnabled) {
                                            Text("Public Profile")
                                        }
                                        
                                        Toggle(isOn: $viewModel.showOnlineStatusEnabled) {
                                            Text("Show Online Status")
                                        }
                                    }
                                    .cornerRadius(25)
                                }
                                .padding()
                                .cornerRadius(25)
                                
                                Button(action: {
                                    viewModel.saveSettings() // Einstellungen speichern
                                }) {
                                    Text("Save Settings")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.brown.opacity(0.7))
                                        .cornerRadius(10)
                                }
                                .padding()
                            }
                        }
                    }
                }
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


import SwiftUI

class SettingsViewModel: ObservableObject {
    // Einstellungsvariablen
    @Published var username: String = "JohnDoe123"
    @Published var email: String = "johndoe@example.com"
    @Published var pushNotificationsEnabled: Bool = true
    @Published var emailNotificationsEnabled: Bool = true
    @Published var publicProfileEnabled: Bool = false
    @Published var showOnlineStatusEnabled: Bool = true
    
    // Funktion zum Speichern der Einstellungen
    func saveSettings() {
        // Hier kannst du die Logik zum Speichern der Einstellungen implementieren
        // z. B. Speichern in einer Datenbank oder einem UserDefaults
    }
}
