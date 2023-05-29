
import SwiftUI
import Combine
import Foundation
import SwiftUI
import Combine
import Foundation

struct ShopItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageURL: String
}

struct ShopView: View {
    @ObservedObject private var viewModel = ShopViewModel()
    @State private var isMenuVisible = false
    @State private var isAddProductVisible = false
    
    @State private var isCreateAdVisible = false

    @State private var title = ""
       @State private var description = ""

    var body: some View {
        VStack {
            // Header
            ZStack {
                Color.brown
                    .frame(height: 200)
                
                Image("shop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                
                
                HStack {
                    Button(action: {
                        isMenuVisible = true
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Image("PetGrooming")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Spacer()
                    
                    Button(action: {
                        isAddProductVisible = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
            
            // Title
            Text("Produktkategorien")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            // Product Categories
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.productCategories, id: \.name) { category in
                        CategoryView(category: category, viewModel: viewModel)
                    }
                }
                .padding(.horizontal)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $isMenuVisible) {
            VStack(spacing: 20) {
                Button(action: {
                    // Handle action for the first menu option
                }) {
                    Text("Zur Bestellliste")
                }
                
                Button(action: {
                    // Handle action for the second menu option
                    isCreateAdVisible = true
                }) {
                    Text("Anzeige aufgeben")
                }
                .sheet(isPresented: $isCreateAdVisible) {
                    CreateAdView()
                }
                
                Button(action: {
                    // Handle action for the third menu option
                }) {
                    Text("Ihre Anzeigen")
                }
            }
        }

        .sheet(isPresented: $isAddProductVisible) {
            VStack(spacing: 20) {
                Text("Produkt hinzufügen")
                    .font(.title)
                
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Handle send button action
                }) {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.gray)
            .cornerRadius(20)
        }

    }
}



struct CreateAdView: View {
    @State private var adTitle = ""
    @State private var adDescription = ""
    @State private var isMenuVisible = false
    @State private var isCreateAdVisible = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Neue Anzeige aufgeben")
                .font(.title)
            
            TextField("Titel", text: $adTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Beschreibung", text: $adDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                // Handle send button action for creating the ad
                createAd()
            }) {
                Text("Anzeige erstellen")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(20)
    }
    
    private func createAd() {
        // Handle logic for creating the ad using the entered data
        print("New ad created!")
        print("Title: \(adTitle)")
        print("Description: \(adDescription)")
        
        // Close the modal sheet after creating the ad
        isCreateAdVisible = false
    }
}
