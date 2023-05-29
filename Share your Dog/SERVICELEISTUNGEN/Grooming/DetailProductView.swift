//
//  DetailProductView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 17.05.23.
//

import SwiftUI


struct DetailProductView: View {
    @ObservedObject var viewModel: ShopViewModel
    var product: String

    var body: some View {
        VStack {
            Text(product)
                .font(.title)
                .padding()

            Spacer()

            HStack {
                Button(action: {
                    viewModel.addToCart(product)
                }) {
                    Text("Zum Warenkorb hinzufügen")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()

                NavigationLink(destination: CartView(viewModel: viewModel)) {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
    }
}



