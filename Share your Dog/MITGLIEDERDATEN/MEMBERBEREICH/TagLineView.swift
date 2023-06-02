//
//  TagLineView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 01.06.23.
//

import SwiftUI


// HeaderText

struct TagLineView: View {
    var body: some View {
        VStack {
            Text("FINDE DEINEN HUNDEFREUND\nUND VERBRING ZEIT\nMIT IHM ")
                .fontWeight(.thin)
                .foregroundColor(Color.gray)
            
            + Text("LOVED IT")
                .fontWeight(.bold)
                .foregroundColor(Color.gray)

        }
    }
}
struct TagLineView_Previews: PreviewProvider {
    static var previews: some View {
        TagLineView()
    }
}
