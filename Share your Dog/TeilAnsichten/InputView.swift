//
//  InputView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 07.05.23.
//

import SwiftUI

// Eingabefelder

// Email
// Password

struct InputView: View {
    
    @Binding var text: String
    
    let title: String
    let placeholder: String
    var isSecureField = false


    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.white))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
               SecureField(placeholder, text: $text)
                    .font(.system(size: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.brown, lineWidth: 1)
                            .padding(.horizontal, 3)
                            .padding(.vertical, 3)

                            .frame(width: 385, height: 45)



                    )
            } else {
                TextField(placeholder, text: $text)
                     .font(.system(size: 18))
                     .overlay(
                         RoundedRectangle(cornerRadius: 6)
                             .stroke(Color.brown, lineWidth: 1)
                             .padding(.horizontal, 3)
                             .padding(.vertical, 3)

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
