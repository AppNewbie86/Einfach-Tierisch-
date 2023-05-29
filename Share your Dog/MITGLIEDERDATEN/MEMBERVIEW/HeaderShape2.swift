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
