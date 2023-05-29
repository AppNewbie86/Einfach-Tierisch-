//
//  CardView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 17.05.23.
//
import SwiftUI
import Foundation

struct CartView: View {
    @ObservedObject var viewModel: ShopViewModel

    var body: some View {
        VStack {
            Text("Warenkorb")
                .font(.title)
                .padding()

            List(viewModel.cartItems, id: \.self) { item in
                Text(item)
            }

            Spacer()

            Button(action: {
                // Aktion beim Checkout
            }) {
                Text("Checkout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}
