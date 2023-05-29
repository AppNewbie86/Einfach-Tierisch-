//
//  TableView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import SwiftUI

struct TableView: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
            Text(value)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .padding(.vertical, 4)
    }
}

