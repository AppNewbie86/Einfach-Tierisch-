//
//  ShopViewModel.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 17.05.23.
//
import SwiftUI
import Combine
import Foundation

class ShopViewModel: ObservableObject {
    @Published var productCategories: [ProductCategory] = []
    @Published var cartItems: [String] = []

    init() {
        loadProductCategories()
    }

    func loadProductCategories() {
        productCategories = [
            ProductCategory(name: "Essen", products: [
                "Bio Hundefutter",
                "Vollkorn Hundefutter",
                "Energiereduziertes Hundefutter",
                "Leckerlies"
            ]),
            ProductCategory(name: "Spielzeug", products: [
                "Kauknolle",
                "Seile",
                "Interaktives Spielz.",
                "Raschelspielzeuge"
            ]),
            ProductCategory(name: "Einkaufen", products: [
                "Fellpflege",
                "Bürsten",
                "Nagelclipser",
                "Ohrenreiniger"
            ]),
            ProductCategory(name: "Zubehör", products: [
                "Halsbaender",
                "Leinen",
                "Hunde Kleidung",
                "Hunde schuhe"
            ])
        ]
    }

    func addToCart(_ product: String) {
        cartItems.append(product)
    }

    func deleteFromCart(_ product: String) {
        if let index = cartItems.firstIndex(of: product) {
            cartItems.remove(at: index)
        }
    }

    func updateCartProduct(_ product: String, with newProduct: String) {
        if let index = cartItems.firstIndex(of: product) {
            cartItems[index] = newProduct
        }
    }
}
