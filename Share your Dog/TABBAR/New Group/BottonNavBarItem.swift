//
//  BottonNavBarItem.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//

import SwiftUI

// Custom TabBar
 struct BottonNavBarItem: View {
     let image : Image
     let action: ()-> Void
     var body: some View {
         
         // Custom TabBar
         HStack {
             Button(action: action, label: {
                 image
                     .frame(maxWidth: .infinity)
             })
             
         }
     }
 }

struct BottonNavBarItem_Previews: PreviewProvider {
    static var previews: some View {
        BottonNavBarItem(image: Image(systemName: "house.fill"), action: {})
            .previewLayout(.sizeThatFits)
    }
}
