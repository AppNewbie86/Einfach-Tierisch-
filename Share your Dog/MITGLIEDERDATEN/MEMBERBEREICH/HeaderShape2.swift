//
//  HeaderShape2.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 28.05.23.
//

import SwiftUI

struct HeaderShape2: View {
    var body: some View {
        ZStack {
            HStack {
                
                Menu {
                    Button(action: {
                        // Data action
                    }) {
                        Label("Data", systemImage: "folder")
                    }
                    
                    Button(action: {
                        // Settings action
                    }) {
                        Label("Settings", systemImage: "gear")
                    }
                    
                    Button(action: {
                        // Dog Pass action
                    }) {
                        Label("Dog Pass", systemImage: "qrcode.viewfinder")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
            .background(Color.brown)
            
            
        }
        .frame(height: 80)
    }
}


struct HeaderShape2_Previews: PreviewProvider {
    static var previews: some View {
        HeaderShape2()
    }
}


struct HeaderShape3: View {
    @EnvironmentObject var authService: AuthService
    @State private var searchText = ""
    
    var body: some View {
        if let user = authService.user {
            ZStack {
                HStack {
                    
                    Text("Hi \(user.userName), willkommen!")
                        .font(.headline)
                    
                    
                    HStack(spacing: 0) {
                        Image("LogoLinks")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        Menu {
                            Button(action: {
                                authService.signOut()
                            }) {
                                Text("Logout")
                            }
                        } label: {
                            Image(systemName: "chevron.down")
                                .imageScale(.large)
                                .foregroundColor(.black)
                        }
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search", text: $searchText)
                            .foregroundColor(.primary)
                            .background(Color.gray.opacity(0.7))
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                searchText = ""
                            }
                        
                    }
                    .padding()
                }
            }
        }
    }
}
