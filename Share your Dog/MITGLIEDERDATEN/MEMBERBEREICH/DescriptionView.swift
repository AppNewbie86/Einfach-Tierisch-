//
//  DescriptionView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Service Angebot")
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
            
            HStack(spacing: 4) {
                ForEach(0..<5) { item in
                    Image(systemName: "star")
                        .foregroundColor(.black)
                }
                Text("4.9")
                    .opacity(0.85)
                    .padding(.leading, 8)
                Spacer()
            }
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}




struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
