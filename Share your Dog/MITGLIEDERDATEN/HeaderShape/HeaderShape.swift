//
//  HeaderShape.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 26.05.23.
//

import SwiftUI
struct HeaderShape: View {
    
    @EnvironmentObject var authService: AuthService

    @State private var isDropdownOpen = false
    @State private var isNewsUpdateOpen = false
    
    var body: some View {
        if let user = authService.user {
            
            ZStack {
                HStack {
                    Spacer()

                    Spacer()
                    //                Text("My Doggy House")
                    //                    .foregroundColor(.white)
                    //                    .font(.title)
                    //                    .fontWeight(.bold)
                    Spacer()
                }
//                .padding()
//                .background(Color.black.opacity(0.75))
                Spacer()

                HStack {
                    Button(action: {
                        isDropdownOpen.toggle()
                    }) {
                        Image(systemName: "menucard")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .popover(isPresented: $isDropdownOpen, arrowEdge: .top) {
                        DropdownMenu(isOpen: $isDropdownOpen)
                    }
                    
                    Spacer()
                    Text("Hi \(user.userName), willkommen!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Button(action: {
                        isNewsUpdateOpen.toggle()
                    }) {
                        Image(systemName: "bell")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .popover(isPresented: $isNewsUpdateOpen, arrowEdge: .top) {
                        NewsUpdateView(isOpen: $isNewsUpdateOpen)
                    }
                }
                .frame(width: 400,height: 80)
                .background(Color.brown.opacity(0.75))
                .ignoresSafeArea(.all)
                
                
            }
        }
        
    }
    struct DropdownMenu: View {
        @Binding var isOpen: Bool
        
        var body: some View {
            VStack(alignment: .leading) {
                Button(action: {
                    isOpen.toggle()
                }) {
                    Text("Settings")
                        .foregroundColor(.white)
                        .padding()
                }
                
                Button(action: {
                    isOpen.toggle()
                }) {
                    Text("HealthPass")
                        .foregroundColor(.white)
                        .padding()
                }
                
                Button(action: {
                    isOpen.toggle()
                }) {
                    Text("Data")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .background(Color.gray)
        }
    }
    
    struct NewsUpdateView: View {
        @Binding var isOpen: Bool
        
        var body: some View {
            VStack {
                Text("News Update")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                
                Button(action: {
                    isOpen.toggle()
                }) {
                    Text("Close")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding()
            }
            .background(Color.white)

        }
    }
}
