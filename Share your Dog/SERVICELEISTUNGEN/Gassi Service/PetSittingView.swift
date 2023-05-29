import SwiftUI
import SwiftUI

struct DogOwner: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let dogName: String
    let dogBreed: String
    let duration: String
    var isStarred: Bool = false
    var feedback: String = ""
}

struct PetSittingView: View {
    @State private var showCreateRequestModal = false
    @State private var acceptedOwners: Set<DogOwner> = []
    @State private var declinedOwners: Set<DogOwner> = []
    @State private var dogOwners: [DogOwner] = [
        DogOwner(name: "Maria Härting", dogName: "Bella", dogBreed: "Labrador", duration: "2 weeks"),
        DogOwner(name: "Dirk Slarowski", dogName: "Max", dogBreed: "German Shepherd", duration: "1 month"),
        DogOwner(name: "Gina", dogName: "Rocky", dogBreed: "Bulldog", duration: "3 days"),
        DogOwner(name: "Max", dogName: "Charlie", dogBreed: "Golden Retriever", duration: "1 week"),
        DogOwner(name: "Heino", dogName: "Luna", dogBreed: "Poodle", duration: "2 weeks")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(dogOwners.indices, id: \.self) { index in
                        let owner = dogOwners[index]
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(owner.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Spacer()
                                Button(action: {
                                    toggleStarred(index)
                                }) {
                                    Image(systemName: owner.isStarred ? "star.fill" : "star")
                                        .foregroundColor(owner.isStarred ? .yellow : .white)
                                }
                                .padding(.top, 8)
                            }
                            
                            HStack {
                                Text("Dog Name:")
                                    .fontWeight(.bold)
                                Text(owner.dogName)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 2)
                            .background(Color("LightBrown"))
                            .cornerRadius(5)
                            
                            HStack {
                                Text("Dog Breed:")
                                    .fontWeight(.bold)
                                Text(owner.dogBreed)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 2)
                            .background(Color("MediumBrown"))
                            .cornerRadius(5)
                            
                            HStack {
                                Text("Duration:")
                                    .fontWeight(.bold)
                                Text(owner.duration)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 2)
                            .background(Color("DarkBrown"))
                            .cornerRadius(5)
                            
                            HStack {
                                Button(action: {
                                    acceptOwner(index)
                                }) {
                                    Text(acceptedOwners.contains(owner) ? "Accepted" : "Annehmen")
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.green.opacity(0.3))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 8)
                                
                                Button(action: {
                                    declineOwner(index)
                                }) {
                                    Text(declinedOwners.contains(owner) ? "Declined" : "Ablehnen")
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.red.opacity(0.3))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 8)
                                
                                Button(action: {
                                    editOwner(index)
                                }) {
                                    Text("Bearbeiten")
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.blue.opacity(0.3))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 8)
                                
                                Button(action: {
                                    deleteOwner(index)
                                }) {
                                    Text("Löschen")
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.orange.opacity(0.3))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 8)
                            }
                            
                            if owner.isStarred {
                                TextField("Feedback", text: $dogOwners[index].feedback)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.top, 8)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.6))
                        .frame(maxHeight: .infinity)
                        .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.brown)
                
                NavigationLink(destination: AcceptedSittingView(acceptedOwners: acceptedOwners)) {
                    Text("Schau akzeptierte Gassitreffen")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.vertical, 20)
                }
                
                NavigationLink(destination: DeclineSittingView(decline: declinedOwners)) {
                    Text("Schau abgelehnte Gassitreffen")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.vertical, 20)
                }
                
            }
            .navigationBarTitle("Hunde Gassi Service")
            .navigationBarItems(trailing:
                Button(action: {
                    showCreateRequestModal = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showCreateRequestModal) {
                CreateSittingRequestView { newRequest in
                    // Add the new request to the list of dogOwners
                }
            }
        }
    }
    
    private func acceptOwner(_ index: Int) {
        let owner = dogOwners[index]
        acceptedOwners.insert(owner)
        declinedOwners.remove(owner)
    }
    
    private func declineOwner(_ index: Int) {
        let owner = dogOwners[index]
        declinedOwners.insert(owner)
        acceptedOwners.remove(owner)
    }
    
    private func toggleStarred(_ index: Int) {
        let owner = dogOwners[index]
        dogOwners[index].isStarred.toggle()
    }
    
    private func editOwner(_ index: Int) {
        let owner = dogOwners[index]
        // Present an edit view or modify the existing view to allow editing of owner details
    }
    
    private func deleteOwner(_ index: Int) {
        let owner = dogOwners[index]
        dogOwners.remove(at: index)
        acceptedOwners.remove(owner)
        declinedOwners.remove(owner)
    }
}

struct AcceptedSittingView: View {
    let acceptedOwners: Set<DogOwner>
    
    var body: some View {
        VStack {
            Text("Akzeptierte Gassitreffen")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach(Array(acceptedOwners), id: \.id) { owner in
                    Text(owner.name)
                }
            }
        }
        .background(Color.brown)
    }
}

struct DeclineSittingView: View {
    let decline: Set<DogOwner>
    
    var body: some View {
        VStack {
            Text("Abgelehnte Gassitreffen")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach(Array(decline), id: \.id) { owner in
                    Text(owner.name)
                    Text(owner.duration)
                }
            }
        }
        .background(Color.brown)
    }
}

struct CreateSittingRequestView: View {
    var createRequest: (DogOwner) -> Void
    
    @State private var name = ""
    @State private var dogName = ""
    @State private var dogBreed = ""
    @State private var duration = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Owner Information")) {
                    TextField("Name", text: $name)
                    TextField("Dog Name", text: $dogName)
                    TextField("Dog Breed", text: $dogBreed)
                }
                
                Section(header: Text("Duration")) {
                    TextField("Duration", text: $duration)
                }
                
                Button(action: {
                    let newRequest = DogOwner(name: name, dogName: dogName, dogBreed: dogBreed, duration: duration)
                    createRequest(newRequest)
                }) {
                    Text("Submit")
                }
            }
            .navigationBarTitle("Anfrageformular")
        }
    }
}
