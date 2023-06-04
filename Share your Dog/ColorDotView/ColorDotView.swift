//
//  ColorDotView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 03.06.23.
//

import SwiftUI

struct ColorDotView: View {
    let color : Color
    var body: some View {
        
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
    
}

struct ColorDotView_Previews: PreviewProvider {
    static var previews: some View {
        ColorDotView(color: Color(.brown))
    }
}
