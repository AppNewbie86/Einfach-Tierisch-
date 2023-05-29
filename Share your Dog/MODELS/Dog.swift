//
//  Dog.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import Foundation
import SwiftUI

struct Dog: Identifiable {
    let id = UUID()
    let name: String
    let breed: String
    let kidsfriendly: String
    let origin: String
    let title: String
    let description: String
    let age: Int
    let imageName: String
    var isAdopted: Bool = false
}
