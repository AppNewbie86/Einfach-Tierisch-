//
//  ServiceButton.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 28.05.23.
//

import Foundation
import SwiftUI


struct ServiceButton: View {
    let symbolName: String
    let color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
            Image(systemName: symbolName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
        }
        .frame(width: 80, height: 80)
    }
}
