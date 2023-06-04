import SwiftUI
import Foundation
import UIKit

struct ProfileView: View {
  
    @EnvironmentObject var authService: AuthService
    // Zustandsvariablen zum Anzeigen der verschiedenen Ansichten
    @State private var ProfileViewisShowing = false
    @State private var ContactViewisShowing = false
    @State private var AdoptionsViewisShowing = false
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack{
                Spacer()
                HomeScreen()
                    .edgesIgnoringSafeArea(.top)
            }
        }
    }
    
}
    
  
