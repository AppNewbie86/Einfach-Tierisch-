//
//  DetailView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import SwiftUI

struct DetailView: View {
    @State private var adoptionFormShown = false
    @State private var sponsorshipFormShown = false
    @State private var acceptedOwners: Set<DogOwner> = []
    
    let dog: Dog
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)]), startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack() {
                    Spacer()
                    
                    Image(dog.imageName)
                        .resizable()
                        .frame(width: 380,height: 360)
                        .aspectRatio(contentMode: .fill)
                    
                    Text(dog.name)
                        .font(.title)
                        .foregroundColor(.black)
                    
                    VStack(alignment: .center) {
                        Text("Eigenschaften")
                            .bold()
                            .foregroundColor(.black)
                            .font(.largeTitle)
                        
                        TableView(label: "Rasse:", value: dog.breed)
                        TableView(label: "Alter:", value: "\(dog.age)")
                        TableView(label: "Herkunft:", value: dog.origin)
                        TableView(label: "Kinderfreundlich", value: dog.kidsfriendly)
                        TableView(label: "Beschreibung", value: dog.description)
                    }
                    .padding()
                        Text("Beschreibung")
                        .padding()
                            .bold()
                            .foregroundColor(.black)
                            .font(.largeTitle)
                        
                        Text(dog.description)
                            .font(.system(size: 18))
                            .fontWeight(.thin)
                            .foregroundColor(.gray)
                        
                    
                        DogServiceShape()
                    }
                
                    Button(action: {
                        adoptionFormShown.toggle()
                    }) {
                        Text("Patenschaft")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 300)
                            .background(Color.brown)
                            .cornerRadius(20)
                    }
                    .sheet(isPresented: $adoptionFormShown) {
                        AdoptionFormView(dog: dog)
                    }
                    
                    Button(action: {
                        sponsorshipFormShown.toggle()
                    }) {
                        Text("Spenden")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 300)
                            .background(Color.brown)
                            .cornerRadius(20)
                    }
                    .sheet(isPresented: $sponsorshipFormShown) {
                        SponsorshipFormView(dog: dog)
                    }
                    
                    .padding()
                    .navigationBarTitle("", displayMode: .inline)
                }
            }
        }
    }


import SwiftUI

struct DetailView1: View {
    
    let cards: ServiceCards

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)]), startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack() {
                    Image(cards.imageName)
                        .resizable()
                        .frame(maxWidth: 400, maxHeight: 400)
                        .cornerRadius(10)
                    
                    
                    Text("Here can Boarding your Service")
                        .font(.headline)
                }
            }
        }
    }
}

import SwiftUI

struct BoardingView: View {
    @State private var selectedService: String = ""
    @State private var name: String = ""
    @State private var frequency: Int = 0
    @State private var experience: String = ""
    @State private var isDogOwner: Bool = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                
                Text("Wählen Sie einen Service aus:")
                    .font(.system(size: 28))
                    .padding()
                
                Picker("Service", selection: $selectedService) {
                    Text("Hundesitten").tag("sitten")
                    Text("Hundetraining").tag("training")
                    Text("Hundetherapien (verifizierte Nummer)").tag("therapien")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Text("Name:")
                    .font(.system(size: 24))

                TextField("Name eingeben", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                Text("Wie oft möchten Sie den Service nutzen?")
                    .font(.headline)
                
                Stepper(value: $frequency, in: 0...10) {
                    Text("\(frequency) Mal pro Woche")
                }
                .padding()
                
                Text("Erfahrung:")
                    .font(.system(size: 22))

                TextField("Erfahrung eingeben", text: $experience)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                Toggle("Sind Sie selbst Hundebesitzer?", isOn: $isDogOwner)
                    .padding()
                
                Button(action: submitForm) {
                    Text("Absenden")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.brown)
                        .cornerRadius(10)
                }
                
            }
            .padding()
        }
    }
    func submitForm() {
        // Hier kannst du die eingegebenen Daten verarbeiten und weiterverwenden
        // z. B. mit einer API-Anfrage oder lokaler Speicherung
        print("Service: \(selectedService)")
        print("Name: \(name)")
        print("Häufigkeit: \(frequency)")
        print("Erfahrung: \(experience)")
        print("Hundebesitzer: \(isDogOwner)")
    }
}

struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        BoardingView()
    }
}


