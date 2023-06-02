//
//  BreedImageViewModel.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 31.05.23.
//

import SwiftUI



class BreedImageViewModel: ObservableObject {
    @Published var imageUrl: URL?
    @Published var isLoading = false
    @Published var error: Error?
    
    func fetchBreedImage(breed: String) {
        isLoading = true
        error = nil
        
        let urlString = "https://dog.ceo/api/breed/\(breed)/images/random"
        guard let url = URL(string: urlString) else {
            error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.error = error
                    return
                }
                
                guard let data = data else {
                    self.error = NSError(domain: "Data Error", code: 0, userInfo: nil)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(BreedImageResponse.self, from: data)
                    if let imageUrlString = result.message, let imageUrl = URL(string: imageUrlString) {
                        self.imageUrl = imageUrl
                    } else {
                        self.error = NSError(domain: "Invalid Image URL", code: 0, userInfo: nil)
                    }
                } catch {
                    self.error = error
                }
            }
        }.resume()
    }
}
