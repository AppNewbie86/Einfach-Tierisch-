
import SwiftUI
struct AdoptionsView: View {
    @State private var selectedTab = "CommunityView" // Track the selected tab

    let dogs: [Dog] = [
        Dog(name: "Buddy", breed: "Labrador Retriever", kidsfriendly: "Ja", origin: "Spain", title: "Verspielt und Kinderlieb",description: "Buddy kommt ursprpnglich aus\nUngarn und wurde aus schlimmen Zuständen\ngerettet und lebt seitdem hier bei uns", age: 3, imageName: "hero1"),
        Dog(name: "Max", breed: "German Shepherd", kidsfriendly: "Nein", origin: "Germany" ,title: "Sollte an erfahrene Hundehalter kommen",description: "Max brauch auf jedenfall\nErfahrung weil er ist draußen mit anderen\nHunden kaum zu bändigen", age: 2, imageName: "hero2"),
        Dog(name: "Charlie", breed: "Golden Retriever", kidsfriendly: "Ja", origin: "Frankreich", title: "Perfekter Familienhund",description: "Charlie ist Anfangs noch\nein wenig schüchtern aber danach\nist er die treuste Seele", age: 4, imageName: "hero3"),
        Dog(name: "Lucy", breed: "Labrador", kidsfriendly: "Ja", origin: "USA", title: "süß mit Knopfaugen",description: "Lucy ist erst ein halbes Jahr alt\nund musste bereits viel erleben dadurch\nist sie ängstlich und brauch viel Liebe", age: 5, imageName: "hero4"),
        Dog(name: "Luna", breed: "Französische Bulldogge", kidsfriendly: "Ja", origin: "Schweiz" ,title: "Verspielt und Kinderlieb",description: "Buddy kommt ursprpnglich aus Ungarn\nund wurde aus schlimmen Zuständen gerettet\nund lebt seitdem hier bei uns", age: 1, imageName: "hero5"),
        Dog(name: "Rocky", breed: "Dackel", kidsfriendly: "Ja", origin: "Canada", title: "Deutscher Dackel",description: "Rocky ist schon ein kleiner Opa\n aber er ist ein sehr lieber und ruhiger\nHund und sucht auf seine letzten Jahre\nein neues Zuhause", age: 3, imageName: "hero7")
    ]
    
       @State private var selectedDogIndex: Int?
       @State private var isShowingDetailView = false
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        
        var body: some View {
            TabView {
                NavigationView {
                    ZStack {
                        // Hintergrundbild "berge" hinzufügen
                        Image("berge")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.6)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            Spacer()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(dogs.indices, id: \.self) { index in
                                        Button(action: {
                                            selectedDogIndex = index
                                        }) {
                                            DogCardView(dog: dogs[index])
                                                .frame(width: 150, height: 200)
                                                .opacity(selectedDogIndex == index ? 1.0 : 0.5)
                                        }
                                    }
                                }
                                .padding(.horizontal, 24)
                            }
                            .frame(height: 220)
                            .padding(.vertical)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )


                            
                            Spacer()
                            
                            if let selectedDogIndex = selectedDogIndex {
                                Text(dogs[selectedDogIndex].description)
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(16)
                            }
                        }
                        .navigationBarTitle("Suchen Zuhause")
                        .sheet(isPresented: $isShowingDetailView) {
                            if let selectedDogIndex = selectedDogIndex {
                                DetailView(dog: dogs[selectedDogIndex])
                            }
                        }
                    }
                }
            }
        }
    }

   struct DogCardView: View {
       let dog: Dog
       
       var body: some View {
           VStack {
               Image(dog.imageName)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .cornerRadius(10)
                   .padding()
               
               Text(dog.name)
                   .font(.headline)
                   .foregroundColor(.black)
               
               Text(dog.breed)
                   .font(.subheadline)
                   .foregroundColor(.black)
           }
           .background(Color.white)
           .cornerRadius(10)
           .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
       }
   }
