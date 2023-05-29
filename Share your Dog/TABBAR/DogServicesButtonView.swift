//
//  DogServicesButtonView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 26.05.23.
//

import SwiftUI

struct DogServicesButtonView: View {
    let image: String
    let label: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
            
            Text(label)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 8)
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
