//
//  SearchBar.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 26.05.23.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .frame(height: 55)
                .background(Color.white)
                .cornerRadius(10)
            
            Button(action: {
                // Search action
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
