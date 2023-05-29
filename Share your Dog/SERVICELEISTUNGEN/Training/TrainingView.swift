//
//  TrainingView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 17.05.23.
//

import SwiftUI

struct TrainingView: View {
    @State private var selectedTraining: Set<String> = []
    @State private var dogName = ""
    @State private var trainingDuration = ""
    @State private var trainingDate = Date()
    
    let trainingOptions = ["Gehorsamstraining", "Agility", "Dummyarbeit", "Spaziergang"]
    
    var body: some View {
        VStack {
            ZStack {
                Color.brown
                    .frame(height: 200)
                
                VStack {
                    Text("Training mit dem Hund")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(30)
                    
                    Text("Hier tragen Sie alle benötigten Informationen zusammen und wenn Sie das erledigt haben, drücken Sie auf 'Senden'. Ihre Anfrage auf ein Training wird dem Hundebesitzer zugestellt.")
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .padding(.vertical, 40)
                }
                .multilineTextAlignment(.center)
            }
            
            Form {
                Section(header: Text("Trainingsdetails")) {
                    TextField("Hundename", text: $dogName)
                    TextField("Dauer", text: $trainingDuration)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Training auswählen")) {
                    ForEach(trainingOptions, id: \.self) { option in
                        Button(action: {
                            toggleSelection(option)
                        }) {
                            HStack {
                                Text(option)
                                    .foregroundColor(selectedTraining.contains(option) ? .white : .black)
                                Spacer()
                                Image(systemName: selectedTraining.contains(option) ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(selectedTraining.contains(option) ? .brown : .gray)
                            }
                        }
                    }
                }
                
                Section(header: Text("Datum")) {
                    DatePicker("Datum", selection: $trainingDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
                
                Button(action: {
                    // Hier kannst du die eingegebenen Daten verarbeiten
                    saveTraining()
                }) {
                    Text("Training speichern")
                        .multilineTextAlignment(.center)
                        .bold()
                }
                .background(Color.white)
            }
            .padding()
        }
        .background(Color.brown)
    }
    
    private func toggleSelection(_ option: String) {
        if selectedTraining.contains(option) {
            selectedTraining.remove(option)
        } else {
            selectedTraining.insert(option)
        }
    }
    
    private func saveTraining() {
        // Hier kannst du die Logik implementieren, um das Training zu speichern oder zu verarbeiten
        print("Training gespeichert!")
        print("Ausgewählte Trainingsarten: \(selectedTraining)")
    }
}
