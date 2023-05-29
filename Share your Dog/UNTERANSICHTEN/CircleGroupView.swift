//
//  CircleGroupView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 05.05.23.
//

import SwiftUI

struct CircleGroupView: View {
    
    // MARK: - PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    // MARK: - Circle Body
    // MARK: - Circle Animation

    var body: some View {
        ZStack {
            
            // create the Circle UI
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 320, height: 320,alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 320, height: 320,alignment: .center)
            
        }// : ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0.75)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}
// MARK: - PREVIEW

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Sonnengelb")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .yellow, ShapeOpacity: 0.45)
        }
    }
}
