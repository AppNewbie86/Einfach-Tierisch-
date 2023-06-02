//
//  AppBarView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 01.06.23.
//

import SwiftUI

// Shape mit 2 Buttons

struct AppBarView: View {
    @State private var showSettings = false // Zustand für das Dropdown-Menü
    
    var body: some View {
        HStack {
            Button(action: {
                showSettings.toggle() // Dropdown-Menü anzeigen/verstecken
            }) {
                Image(systemName: "text.justify")
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 42, height: 42)
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            )

            .popover(isPresented: $showSettings, arrowEdge: .top) {
                // Dropdown-Menü-Inhalt hier einfügen, z. B. eine Liste von Aktionen
                NavigationView {
                    List {
                        NavigationLink(destination: SettingsView()) {
                            Text("Settings")
                        }
                        Button(action: {
                            // Logout-Logik hier einfügen
                        }) {
                            Text("Logout")
                        }
                        
                    }
                    .navigationBarTitle("Menu")
                    .background(Color("Bg"))
                }
            }
            
            Spacer()
            
            NavigationLink(destination: CreateProfileView()) {
                Image(systemName: "person.circle")
                    .foregroundColor(.black)
                    .padding(.all, 20)
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    )
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(Color.brown.opacity(0.7))
        .background(
            RoundedRectangle(cornerRadius: 15)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        )

    }
}



struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView()
    }
}
