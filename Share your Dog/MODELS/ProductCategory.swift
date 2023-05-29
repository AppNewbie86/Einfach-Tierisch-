//
//  ProductCategory.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 17.05.23.
//

import Foundation
import SwiftUI

struct ProductCategory: Identifiable,Decodable {
    let id = UUID()
    let name: String
    let products: [String]
}
