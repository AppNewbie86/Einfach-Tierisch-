//
//  SponsorshipFormView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//
import SwiftUI
import Foundation
    struct SponsorshipFormView: View {
        @State private var fullName = ""
        @State private var email = ""
        @State private var sponsorshipType = ""
        
        @State private var spendsum : Int = 1

        
        
        let dog: Dog
        
        var body: some View {
            ZStack {
                LinearGradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                Form {
                    Section(header: Text("Sponsortype Form")) {
                        TextField("Vollständiger Name", text: $fullName)
                        TextField("Email", text: $email)
                        TextField("Spenden Type", text: $sponsorshipType)
                        
                        TextField("Spenden Summe", text: Binding<String>(
                            get: { String(spendsum) },
                            set: { spendsum = Int($0) ?? 0 }
                        ))
                    }
                    
                    Section {
                        Button(action: {
                            submitSponsorshipForm()
                        }) {
                            Text("Anfrage absenden")
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
            .cornerRadius(10)
        }
        private func submitSponsorshipForm() {
            // Perform submission logic here
            // You can access the form data using the properties like fullName, email, sponsorshipType
            
            // Example: Printing the form data
            print("Sponsorship Form Data:")
            print("Full Name: \(fullName)")
            print("Email: \(email)")
            print("Sponsorship Type: \(sponsorshipType)")
            
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

struct SponsorshipFormView_Previews: PreviewProvider {
    static var previews: some View {
        SponsorshipFormView(dog: Dog(name: "Bruno", breed: "Stephard-Terrier", kidsfriendly: "Yes", origin: "Germany", title: "lieber und erzogener Hund", description: "erozogener und Kinder lieber Hund der es mag draussen mit Kindern und Familie zu spielen", age: 5, imageName: "hero5"))
    }
}
