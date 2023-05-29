//
//  InputView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 07.05.23.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    
    let title: String
    let placeholder: String
    var isSecureField = false


    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
               SecureField(placeholder, text: $text)
                    .font(.system(size: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.brown, lineWidth: 1)
                            .padding(.horizontal, 5)
                            .frame(width: 385, height: 45)


                    )
            } else {
                TextField(placeholder, text: $text)
                     .font(.system(size: 18))
                     .overlay(
                         RoundedRectangle(cornerRadius: 4)
                             .stroke(Color.brown, lineWidth: 1)
                             .padding(.horizontal, 5)
                             .frame(width: 385, height: 45)


                     )
            }
            
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}
