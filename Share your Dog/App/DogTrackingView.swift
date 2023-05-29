import SwiftUI
import MapKit

struct DogTrackingView: View {
    @State private var showModal = false
    @State private var dogName = ""
    @State private var lastSighting = ""
    @State private var escapedLocation = ""
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Dog Search")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: {
                    showModal = true
                }) {
                    Text("Open Modal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(10)
                }
                
                // Hier kannst du die Google Maps-Karte mit der gesuchten Stadt anzeigen
                if !escapedLocation.isEmpty {
                    MapView(coordinate: Binding.constant(region.center), region: $region)
                        .frame(height: 300)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .sheet(isPresented: $showModal) {
                DogSearchModalView(dogName: $dogName, lastSighting: $lastSighting, escapedLocation: $escapedLocation, region: $region)
            }
        }
    }
    
}
