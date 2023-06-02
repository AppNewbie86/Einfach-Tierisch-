import SwiftUI
import Foundation
import UIKit

struct ProfileView: View {
  
    @EnvironmentObject var authService: AuthService
    
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
    
  
