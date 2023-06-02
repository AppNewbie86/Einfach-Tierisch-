import SwiftUI
import URLImage

// TabTarget Hunderassen

struct BreedListView: View {
    @ObservedObject var viewModel: BreedListViewModel // Überwachung durch BreedListViewModel
    @State private var selectedTab = "BreedListView" // Zeigt das akt. Ziel

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
            .navigationTitle("HundeWiki") // Zeigt den Titel an oben
        }
        .onAppear {
            viewModel.fetchBreeds()
        }
        .background(
            
            LinearGradient(
                gradient: Gradient(colors: [.brown.opacity(0.10), .brown.opacity(0.07)]),
                startPoint: .topLeading,
                endPoint: .bottomLeading
            )
            .edgesIgnoringSafeArea(.all)
            
        )
       
        
    }
    
}


