//
//  GalleryView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 08.05.23.
//
//
//import SwiftUI
//
//struct GalleryView: View {
//
//    // MARK: - PROBERTYS
//
//    let animals: [Animal] = Bundle.main.decode("animals.json")
//
//
//    // SIMPLE GRID DEFINITION
//    let gridLayout : [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            //MARK: - GRID
//            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
//                ForEach(0..<12) { item in
//                    Text("Gallery")
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(MotionAnimationView())
//    }
//}
//struct GalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        GalleryView()
//    }
//}
