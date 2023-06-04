
import SwiftUI

struct UserHeaderView: View {
    @State private var userLoggedIn: Bool = false
    @State private var username: String = ""
    @State private var status: UserStatus = .offline
    
    enum UserStatus {
        case online
        case offline
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Willkommen,")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(username)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                Text(status == .online ? "Online" : "Offline")
                    .font(.subheadline)
                    .foregroundColor(status == .online ? .green : .red)
                Text("Vielen Dank, dass Sie unseren Service nutzen. Sie können alle Funktionen genießen und von exklusiven Angeboten profitieren.")
                    .font(.body)
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("HeaderBackground"))
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            )
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 20)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("HeaderGradientStart"), Color("HeaderGradientEnd")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .onAppear {
            // Simuliere den Benutzerstatus und den Benutzernamen (kann mit echten Daten ersetzt werden)
            simulateUserStatus()
        }
    }
    
    private func simulateUserStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            username = "Max Mustermann"
            userLoggedIn = true
            status = .online
        }
    }
}

struct UserHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        UserHeaderView()
    }
}
