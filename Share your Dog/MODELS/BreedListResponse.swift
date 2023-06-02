//
//  BreedListResponse.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 31.05.23.
//

import Foundation

struct BreedListResponse: Decodable {
    let message: [String: [String]]
    let status: String
}
