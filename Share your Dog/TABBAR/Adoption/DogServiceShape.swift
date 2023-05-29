//
//  DogServiceShape.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import SwiftUI

struct DogServiceShape: View {
    var body: some View {
        VStack {
            HStack {
                Image("Poo")
                    .font(.system(size: 26))
                Image("Water")
                    .font(.system(size: 26))
                Image("Time")
                    .font(.system(size: 26))
                Image("Walking")
                    .font(.system(size: 26))
            }
            .padding()
       
        }
        .padding()
    }
}
