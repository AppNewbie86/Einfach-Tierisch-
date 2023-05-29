//
//  PetSittingView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 11.05.23.
//

import SwiftUI
import Foundation

import SwiftUI

struct PetSittingView: View {
    @State private var showCreateRequestModal = false
    @State private var acceptedOwners: Set<DogOwner> = []

    var dogOwners: [DogOwner] = [
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
                    ForEach(dogOwners, id: \.self) { owner in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(owner.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
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
                            
                            Button(action: {
                                acceptOwner(owner)
                            }) {
                                Text(acceptedOwners.contains(owner) ? "Accepted" : "Accept")
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(Color.brown)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.top, 8)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                .padding()
                
                NavigationLink(destination: AcceptedSittingView(acceptedOwners: acceptedOwners)) {
                    Text("View Accepted Sitting")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.vertical, 20)
                }
            }
            .navigationBarTitle("Pet Sitting")
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
    
    func acceptOwner(_ owner: DogOwner) {
        if acceptedOwners.contains(owner) {
            acceptedOwners.remove(owner)
        } else {
            acceptedOwners.insert(owner)
        }
    }
    
}


struct CreateSittingRequestView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var dogName = ""
    @State private var dogBreed = ""
    @State private var duration = ""
    
    var onSave: (DogOwner) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Owner Details")) {
                    TextField("Name", text: $name)
                    TextField("Dog Name", text: $dogName)
                    TextField("Dog Breed", text: $dogBreed)
                    TextField("Duration", text: $duration)
                }
                
                Button(action: {
                    saveRequest()
                }) {
                    Text("Save")
                }
            }
            .navigationBarTitle("Create Sitting Request")
            .navigationBarItems(trailing:
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
    
    func saveRequest() {
        let newRequest = DogOwner(name: name, dogName: dogName, dogBreed: dogBreed, duration: duration)
        onSave(newRequest)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AcceptedSittingView: View {
    let acceptedOwners: Set<DogOwner>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(acceptedOwners), id: \.self) { owner in
                    VStack(alignment: .leading) {
                        Text(owner.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        HStack {
                            Text("Dog Name:")
                                .fontWeight(.regular)
                            Text(owner.dogName)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Text("Dog Breed:")
                                .fontWeight(.regular)
                            Text(owner.dogBreed)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Text("Duration:")
                                .fontWeight(.regular)
                            Text(owner.duration)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .navigationBarTitle("Accepted Dog Sittings")
        }
    }
}
