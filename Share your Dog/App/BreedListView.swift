import SwiftUI
import URLImage

struct BreedListView: View {
    @ObservedObject var viewModel: BreedListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let breeds = viewModel.breeds {
                    List(breeds.keys.sorted(), id: \.self) { breed in
                        NavigationLink(destination: BreedImageView(breed: breed, viewModel: BreedImageViewModel())) {
                            Text(breed)
                                .font(.headline)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle()) // Entfernt den Standard-Button-Stil
                    }
                } else if let error = viewModel.error {
                    Text(error.localizedDescription)
                }
            }
            .navigationTitle("Bekannte Hunderassen")
        }
        .onAppear {
            viewModel.fetchBreeds()
        }
    }
}

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
struct BreedListResponse: Decodable {
    let message: [String: [String]]
    let status: String
}

struct BreedImageResponse: Decodable {
    let message: String?
    let status: String
}


