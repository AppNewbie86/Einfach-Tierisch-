import SwiftUI
import MapKit

struct DogSearchView: View {
    @State private var showModal = false
    @State private var dogName = ""
    @State private var lastSighting = ""
    @State private var escapedLocation = ""
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        VStack {
            Text("Hier können Sie ihren Hund\nper GPS Tracken ")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                showModal = true
            }) {
                Text("Zur Eingabemaske")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            
            // Hier kannst du die Google Maps-Karte mit der gesuchten Stadt anzeigen
            if !escapedLocation.isEmpty {
                MapView(coordinate: $region.center, region: $region)
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .sheet(isPresented: $showModal) {
            DogSearchModalView(dogName: $dogName, lastSighting: $lastSighting, escapedLocation: $escapedLocation, region: $region)
                .background(Color.brown)
        }
    }
}

struct DogSearchModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var dogName: String
    @Binding var lastSighting: String
    @Binding var escapedLocation: String
    @Binding var region: MKCoordinateRegion
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.brown.opacity(0.50), .brown.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                Form {
                    Section(header: Text("Dog Information")) {
                        TextField("Dog Name", text: $dogName)
                        TextField("Last Sighting", text: $lastSighting)
                        TextField("Escaped Location", text: $escapedLocation)
                    }
                    
                    Section {
                        Button(action: {
                            // Hier kannst du die Aktion ausführen, um die Google Maps-Karte zu aktualisieren
                            // basierend auf der gesuchten Stadt oder dem entlaufenen Ort
                            
                            // Beispielaktion: Drucke die eingegebenen Daten
                            print("Dog Name:", dogName)
                            print("Last Sighting:", lastSighting)
                            print("Escaped Location:", escapedLocation)
                            
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Search")
                        }
                    }
                }
                .navigationBarTitle("Find Your Dog via GPS")
                .navigationBarItems(trailing: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}
struct MapView: UIViewRepresentable {
    @Binding var coordinate: CLLocationCoordinate2D
    @Binding var region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        uiView.addAnnotation(annotation)
    }
}

