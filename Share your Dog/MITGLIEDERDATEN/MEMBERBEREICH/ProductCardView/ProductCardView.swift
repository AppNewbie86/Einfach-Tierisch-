//
//  ProductCardView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//

import Foundation
import SwiftUI

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 210, height: 200)
                .cornerRadius(20)
            
            Text("Möglichkeiten")
                .foregroundColor(.black)
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 2) {
                ForEach(0..<5) { item in
                    Image(systemName: "star")
                        .foregroundColor(.black)
                }
                Spacer()
                
                Text("$100/Monat")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
        .padding(20)
        .background(Color.white.opacity(0.6))
        .cornerRadius(20)
    }
}
