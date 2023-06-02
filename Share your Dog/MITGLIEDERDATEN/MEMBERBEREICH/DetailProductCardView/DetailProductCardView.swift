//
//  DetailProductCardView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 02.06.23.
//

import SwiftUI

struct DetailProductCardView: View {
    var body: some View {
        VStack{
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image("boarding")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
                    DescriptionView()
                        .offset(y: -40)
                    
                }
            }
        }
    }
    
    struct DetailProductCardView_Previews: PreviewProvider {
        static var previews: some View {
            DetailProductCardView()
        }
    }
}

  
