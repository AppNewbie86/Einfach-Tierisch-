//
//  BreedListViewModel.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 31.05.23.
//

import SwiftUI


class BreedListViewModel: ObservableObject {
    @Published var breeds: [String: [String]]?
    @Published var isLoading = false
    @Published var error: Error?
    
    func fetchBreeds() {
        isLoading = true
        error = nil
        
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")!
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
                    let result = try JSONDecoder().decode(BreedListResponse.self, from: data)
                    self.breeds = result.message
                } catch {
                    self.error = error
                }
            }
        }.resume()
    }
}
