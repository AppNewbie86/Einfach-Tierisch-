import SwiftUI
import AVKit

struct CommunityView: View {
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
            .navigationTitle("Treffpunkt")
            .multilineTextAlignment(.center)
        }
    }
}


struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
