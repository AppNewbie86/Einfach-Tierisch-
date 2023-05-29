//
//  AdoptionFormView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import SwiftUI


struct AdoptionFormView: View {
    @State private var fullName = ""
    @State private var address = ""
    @State private var zipCode = ""
    @State private var phoneNumber = ""
    
    @State private var costs = ""
    @State private var expirience = ""
    @State private var ownDog : Int = 350

    
    var dog: Dog
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            Form {
                Section(header: Text("Adoption Form")) {
                    TextField("Vollständiger Name", text: $fullName)
                        .foregroundColor(.white)
                    
                    TextField("Addresse", text: $address)
                        .foregroundColor(.white)
                    
                    TextField("Telefonnummer", text: $phoneNumber)
                        .foregroundColor(.white)
                    
                    Text(costs)
                        .foregroundColor(.white)
                    
                }
                
                Section {
                    Button(action: {
                    }) {
                        Text("Antrag senden")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.brown)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
    private mutating func submitAdoptionForm() {
        // Perform submission logic here
        // You can access the form data using the properties like fullName, address, phoneNumber
        
        // Example: Printing the form data
        print("Adoption Form Data:")
        print("Vollständiger Name: \(fullName)")
        print("Addresse: \(address)")
        print("Telefonnummer: \(phoneNumber)")
        
        // Mark the dog as adopted
        self.dog.isAdopted = true
        
        // Dismiss the sheet
        dismissSheet()
    }
    
    private func dismissSheet() {
        // Close the sheet
        DispatchQueue.main.async {
            // Use a delay to ensure the form submission is completed before dismissing the sheet
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // Dismiss the sheet
                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}



