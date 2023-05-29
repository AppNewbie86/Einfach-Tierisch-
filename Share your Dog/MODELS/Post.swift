//
//  Post.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let image: UIImage?
}
