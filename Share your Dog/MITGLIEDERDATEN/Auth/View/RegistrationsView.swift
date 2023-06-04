import SwiftUI
import Foundation
struct RegistrationsView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @State private var isAnimating: Bool = false
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 100) // Abstand am oberen Rand
                
                
                Image("LogoLinks")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 32)
                
                Spacer()
                
                Text("Registrieren")
                    .font(.custom("Playfairdisplay-Regular", size: 45))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundColor(.brown)
                    .multilineTextAlignment(.center)
                
                
                
                
                VStack(spacing: 5) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .foregroundColor(.white)
                        .autocapitalization(.none)
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                    
                    InputView(text: $fullname, title: "Full Name", placeholder: "Enter your Name")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your Password", isSecureField: true)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                    
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your Password", isSecureField: true)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical)
                    
                }
                .padding(.top, 12)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity)
                
                
                Button(action: {
                    Task {
                        authService.signUp(email: email, password: password, fullname: fullname)
                    }
                }) {
                    Text("Registrieren")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
                .frame(maxWidth: .infinity)
                .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                .padding(.bottom, 20)
                
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an ")
                            .foregroundColor(.white)
                        
                        Text("Account")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        
                    }
                    .font(.system(size: 14))
                    .padding(.bottom, 60)
                }
                .font(.system(size: 10))
                .frame(maxWidth: .infinity)
            }
            //.padding()
            .background(
                Image("background3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.35)
            )
        }
    }
}
