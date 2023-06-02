//
//  SearchAndScanView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 01.06.23.
//

import SwiftUI


// SearchBar

struct SearchAndScanView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            Image("magnifyingglass")
                .foregroundColor(.black)
            
            TextField("Produktsuche", text: $search)
                .foregroundColor(.black)
                .frame(height: 40)
                .padding(.horizontal, 8)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            Button(action: {
                // Perform search action here
                // For example, navigate to search results screen
            }) {
                Text("Search")
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.brown)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 16)
        .multilineTextAlignment(.center)
    }
}

struct SearchAndScanView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndScanView()
    }
}
