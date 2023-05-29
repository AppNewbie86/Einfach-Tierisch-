import SwiftUI
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authService: AuthService
    @State private var selectedTab = "Home" // Track the selected tab
    @State private var isDropdownOpen = false
    @State private var isNewsUpdateOpen = false
    @State private var searchText = ""
    @State var title  = ""
    @State var description = ""

    var body: some View {
        if let user = authService.user {
            VStack {
                HStack {
                    AccountSection(user: User(id: "1", fullname: "Franz Muster", age: 34, email: "testemail@web.de", userName: "Franz"))
                        .padding()
                        .background(Color.gray)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    
                    Image("LogoLinks")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    
                    Text("Status")
                }
                // Searchbar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchText)
                        .foregroundColor(.primary)
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            searchText = ""
                        }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                )
                .padding(.horizontal)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                
                ScrollView {
  
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), spacing: 16) {
                        NavigationLink(destination: TrainingView()) {
                            ServiceButton(symbolName: "figure.highintensity.intervaltraining", color: .gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .background(Color.gray)
                        .cornerRadius(10)
                        .padding()

                        NavigationLink(destination: PetSittingView()) {
                            ServiceButton(symbolName: "magnifyingglass", color: .gray)
                            
                        }
                        .buttonStyle(ServiceButtonStyle())
                        
                        
                        NavigationLink(destination: ShopView()) {
                            ServiceButton(symbolName: "bag.circle", color: .gray)
                        }
                        .buttonStyle(ServiceButtonStyle())

                        NavigationLink(destination: DogSearchView()) {
                            ServiceButton(symbolName: "pawprint", color: .gray)
                            
                        }
                        .buttonStyle(ServiceButtonStyle())
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 16)
                    
                    
                }
                .background(
                    
                    LinearGradient(
                        gradient: Gradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)]),
                        startPoint: .topLeading,
                        endPoint: .bottomLeading
                    )
                    .edgesIgnoringSafeArea(.all)
                    
                )
                
                Spacer() // Add spacer to push the TabBar to the bottom
                TabBar(selectedTab: $selectedTab) // Add the TabBar view at the bottom
            }
        }
    }
}

struct ServiceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(configuration.isPressed ? Color.brown.opacity(0.8) : Color.brown)
            )
    }
}


    
    struct TabBar: View {
        @Binding var selectedTab: String // Add a binding for the selected tab
        
        var body: some View {
            HStack {
                TabBarButton(imageName: "person.crop.circle", title: "Zuhause", selectedTab: $selectedTab, destination: ContactView())
                    .padding()
                
                TabBarButton(imageName: "heart.fill", title: "News", selectedTab: $selectedTab, destination: NewsView(viewModel: NewsViewModel()))
                    .padding()
                
                TabBarButton(imageName: "book.closed", title: "Forum", selectedTab: $selectedTab, destination: CommunityView())
                    .padding()
                
                TabBarButton(imageName: "envelope.fill", title: "Tierstation", selectedTab: $selectedTab, destination: AdoptionsView())
                    .padding()
                
                TabBarButton(imageName: "pawprint", title: "Lexika", selectedTab: $selectedTab, destination: BreedListView(viewModel: BreedListViewModel()))
                    .padding()
                
            }
            .shadow(color: Color.gray.opacity(0.25), radius: 5, x: 0, y: -3)
            .frame(maxWidth: .infinity)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom) // Add padding to accommodate the safe area at the bottom
            .background(Color.black) // Set the background color of the TabBar
            
            .fixedSize(horizontal: false, vertical: true)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    struct TabBarButton<Destination: View>: View {
        let imageName: String
        let title: String
        @Binding var selectedTab: String // Add a binding for the selected tab
        let destination: Destination // The destination view
        
        var body: some View {
            NavigationLink(destination: destination) { // Use NavigationLink to navigate to the corresponding view
                VStack {
                    Image(systemName: imageName)
                        .font(.system(size: 24))
                    
                    Text(title)
                        .font(.caption)
                }
            }
        }
    }
  
   
