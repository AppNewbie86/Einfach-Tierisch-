import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Feedback", "Kaufen", "Abwicklung", "Bezahlen"]
    @State private var selectedTab: Tab = .house
    @State private var userLoggedIn = true // Beispielhafter Benutzerstatus
    @State private var username = "Max Mustermann" // Beispielhafter Benutzername
    
    enum Tab {
        case house
        case bubble
        case heart
        case cross
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Spacer(minLength: 30)
                            AppBarView()
                            TagLineView()
                                .padding(20)
                            SearchAndScanView()
                            
                            // Restlicher Code...
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(0 ..< categories.count) { i in
                                        NavigationLink(destination: DestinationView()) {
                                            CategoryView(isActive: i == selectedIndex, text: categories[i])
                                                .padding()
                                                .background(Color.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                                .shadow(color: Color.black.opacity(0.25), radius: 8, x: 2, y: 4)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                                )
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 20)
                                .background(
                                    ZStack {
                                        Color.white
                                            .blur(radius: 20)
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                                    }
                                )
                            }
                            
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    NavigationLink(destination: DetailProductCardView()) {
                                        ProductCardView(image: Image("boarding1"), size: 300)
                                            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)
                                    }
                                    .navigationBarHidden(true)
                                    .padding(.horizontal)
                                    
                                    NavigationLink(destination: DogTrackingView()) {
                                        ProductCardView(image: Image("boarding2"), size: 300)
                                            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)
                                    }
                                    .navigationBarHidden(true)
                                    .padding(.horizontal)
                                    
                                    NavigationLink(destination: TrainingView()) {
                                        ProductCardView(image: Image("boarding3"), size: 300)
                                            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)
                                    }
                                    .navigationBarHidden(true)
                                    .padding(.horizontal)
                                    
                                    NavigationLink(destination: BoardingView()) {
                                        ProductCardView(image: Image("boarding4"), size: 300)
                                            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)
                                    }
                                    .navigationBarHidden(true)
                                    .padding(.horizontal)
                                }
                            }
                            
                            VStack {
                                HStack {
                                    Text("Produkte des Monats")
                                        .font(.custom("Playfairdisplay-Regular", size: 24))
                                        .bold()
                                        .foregroundColor(.red.opacity(0.7))
                                        .padding()
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: ShopView()) {
                                        Image(systemName: "bag")
                                            .foregroundColor(.black)
                                            .padding(.all, 20)
                                            .frame(width: 42, height: 42)
                                    }
                                    .padding()
                                }
                                // Setze den Hintergrund mit einer Rechteck und einem Farbverlauf.
                                .background(LinearGradient(colors: [.brown, .clear], startPoint: .topLeading, endPoint: .bottomTrailing), in: Rectangle())
                                .position(x: 195, y: 35) // Hier stellt man den braunen Rahmen an die richtige Position
                                
                                ScrollView(.vertical, showsIndicators: false) {
                                    ScrollViewReader { scrollViewProxy in
                                        VStack(spacing: 16) {
                                            ForEach(0 ..< 4) { index in
                                                ProductCardView(image: Image("futter\(index + 1)"), size: 210)
                                                    .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)
                                                    .onTapGesture {
                                                        // Hier kannst du eine Aktion ausführen, wenn eine ProductCardView ausgewählt wird
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 20)
                                        .onAppear {
                                            // Scroll zur anfänglichen Position (optional)
                                            scrollViewProxy.scrollTo(0)
                                        }
                                    }
                                }
                                
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                )
                            }
                            .padding(.bottom, 20) // Platz für die TabBar lassen
                        }
                    }
                    
                    VStack {
                        HStack {
                            NavigationLink(destination: HomeScreen()) {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            NavigationLink(destination: ContactView()) {
                                Image(systemName: "ellipsis.bubble")
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            NavigationLink(destination: BreedListView(viewModel: BreedListViewModel())) {
                                Image(systemName: "pawprint")
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            NavigationLink(destination: AdoptionsView()) {
                                Image(systemName: "pawprint")
                                    .foregroundColor(.black)
                            }
                            
                        }
                        .padding()
                        .padding(.vertical, 20) // Hier kannst du den Wert anpassen, um die Höhe der TabBar zu erhöhen
                        .frame(width: 350)
                        .background(Color.brown)
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.55), radius: 8, x: 2, y: 6)
                    }
                    
                    .frame(maxWidth: .infinity)
                    .background(Color("Bg")) // Hintergrundfarbe anpassen
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct DestinationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Titel")
            
        }
    }
}
