import SwiftUI
import AVKit
import Foundation

struct CommunityView: View {
    
    @Binding var selectedTab: String // Add a binding for the selected tab

    var body: some View {
        NavigationView {
           
                List {
                    Text("Diskussion über Symptome bei Hunden")
                        .foregroundColor(.brown)
                        .font(.subheadline)
                    
                    
                    NavigationLink(destination: TopicView()) {
                        Text("Anzeichen für Erkrankungen")
                        
                    }
                    Text("Diskussion über ausgewogene Ernährung")
                        .foregroundColor(.brown)
                        .font(.subheadline)
                    
                    
                    
                    NavigationLink(destination: TopicView()) {
                        Text("Die richtige Ernährung")
                        
                    }
                    Text("Diskussion über Haltung und deren Tips")
                        .foregroundColor(.brown)
                        .font(.subheadline)
                    
                    
                    
                    NavigationLink(destination: TopicView()) {
                        Text("Die richtige Haltung")
                        
                    }
                    
                    // Weitere Themen hier hinzufügen
                }
                .navigationTitle("FORUM")
                .multilineTextAlignment(.center)
            }
            
            Spacer() // Add spacer to push the TabBar to the bottom
       
            
            .background(
            LinearGradient(
                gradient: Gradient(colors: [.brown.opacity(0.10), .brown.opacity(0.67)]),
                startPoint: .topLeading,
                endPoint: .bottomLeading
            )
            .edgesIgnoringSafeArea(.all)
            
        )}
    }

