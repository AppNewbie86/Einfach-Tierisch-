//
//  FavoriteShape.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 12.05.23.
//

import SwiftUI

struct FavoriteShape: View {
    @State private var selectedButton = "FavoriteButton" // Button who was selected

    var body: some View {
        VStack {
            HStack {
                FavoriteShapeButton(imageName: "pawprint", title: "Sitting", selectedTab: $selectedButton, destination: FavoriteDetailView())
            }
        }
    }
}

struct FavoriteShape_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteShape()
    }
}


struct FavoriteShapeButton<Destination: View>: View {
    let imageName: String
    let title: String
    @Binding var selectedTab: String // Add a binding for the selected tab
    let destination: Destination // The destination view
    
    var body: some View {
        NavigationLink(destination: destination) { // Use NavigationLink to navigate to the corresponding view
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == title ? .blue : .black) // Highlight the selected tab
                
                Text(title)
                    .font(.footnote)
                    .foregroundColor(selectedTab == title ? .blue : .black) // Highlight the selected tab
            }
        }
        .frame(maxWidth: .infinity) // Expand to the full width
    }
}

