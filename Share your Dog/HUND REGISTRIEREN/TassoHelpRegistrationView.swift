//
//  TassoHelpRegistrationView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 23.05.23.
//

import SwiftUI

struct TassoHelpRegistrationView: View {
    let instructions: [(image: String, text: String)] = [
        (image: "step1", text: "Schritt 1: Öffne die Tasso-App"),
        (image: "step2", text: "Schritt 2: Wähle die Option 'Registrieren'"),
        (image: "step3", text: "Schritt 3: Gib deine persönlichen Daten ein"),
        // Fügen Sie weitere Schritte hinzu...
    ]
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                ForEach(0..<instructions.count) { index in
                    let instruction = instructions[index]
                    
                    VStack(spacing: 10) {
                        Image(instruction.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                        
                        Text(instruction.text)
                            .font(.headline)
                            .foregroundColor(Color.gray)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    // Aktion für den Button hier einfügen
                }) {
                    Text("Registrieren")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("ButtonColor"))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }
}


struct TassoHelpRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        TassoHelpRegistrationView()
    }
}
