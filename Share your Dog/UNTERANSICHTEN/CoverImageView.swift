//
//  CoverImageView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 09.05.23.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - PROBERTYS
    
    // MARK: - BODY

    var body: some View {
        
        TabView {
            ForEach(0..<5) { item in
                Image("titlepic")
                    .resizable()
                    .scaledToFit()
            }//: LOOB
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        
    }
}
//MARK: PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
