//
//  RoundedButtonStyle.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(20)
            .font(.title)
    }
}

