//
//  CategoryView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 17.05.23.
//

import SwiftUI

struct CategoryView: View {
    let isActive : Bool
    let text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
           Text(text)
               .font(.system(size: 20))
               .fontWeight(.medium)
               .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            
            if(isActive) {
                Color("Primary")
            }
      //          .padding(.horizontal)
            
       //     ForEach(category.products, id: \.self) { product in
         //       NavigationLink(destination: Text("Product Details: \(product)")) {
                    HStack {
        //                Text(product)
         //                   .padding()
         //                   .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.brown)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
                }
            }
        }
  
