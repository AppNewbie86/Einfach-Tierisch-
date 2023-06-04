//
//  ServiceSection.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 29.05.23.
//
//
//import SwiftUI
//
//struct ServiceSection: View {
//    let cards: [ServiceCards] = [
//        ServiceCards(name: "Boarding", imageName:"boarding"),
//        ServiceCards(name: "Grooming", imageName: "grooming"),
//        ServiceCards(name: "Health", imageName: "health"),
//        ServiceCards(name: "Training", imageName: "training")
//    ]
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            Text("Services")
//                .font(.title)
//                .fontWeight(.bold)
//
//            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//                ForEach(cards) { card in
//                    ServiceCardView(card: card)
//                }
//            }
//        }
//        .padding(.top, 16)
//    }
//}

//
//struct ServiceSection_Previews: PreviewProvider {
//    static var previews: some View {
//        ServiceSection()
//    }
//}
