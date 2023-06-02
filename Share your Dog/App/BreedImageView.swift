//
//  BreedImageView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 31.05.23.
//

import SwiftUI
import URLImage


struct BreedImageView: View {
    let breed: String
    @ObservedObject var viewModel: BreedImageViewModel
    @State private var selectedButton = "FavoriteButton" // Button who was selected

    
    var body: some View {
        VStack {
            
            if viewModel.isLoading {
                ProgressView()
            } else if let imageUrl = viewModel.imageUrl {
                
                URLImage(imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                Text("Breed: \(breed.capitalized)")
            } else if let error = viewModel.error {
                Text(error.localizedDescription)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchBreedImage(breed: breed)
        }
        .navigationTitle(breed.capitalized)
    }
}


struct BreedImageView_Previews: PreviewProvider {
    static var previews: some View {
        BreedImageView(breed: "", viewModel: BreedImageViewModel())
    }
}
