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
            ZStack {
                Image("Opening Screen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                        .frame(height: 100) // Abstand am oberen Rand
                    
                    Text("einfach")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .font(.system(size: 40))
                    
                    Text("Tierisch")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .font(.system(size: 60))
                        .padding(.vertical, 32)
                    
                    VStack(spacing: 5) {
                        InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                            .autocapitalization(.none)
                            .padding(.horizontal)
                        
                        InputView(text: $fullname, title: "Full Name", placeholder: "Enter your Name")
                            .padding(.horizontal)
                        
                        InputView(text: $password, title: "Password", placeholder: "Enter your Password", isSecureField: true)
                            .padding(.horizontal)
                        
                        InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your Password", isSecureField: true)
                            .padding(.horizontal)
                    }
                    .padding(.top, 12)
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        Task {
                            authService.signUp(email: email, password: password, fullname: fullname)
                        }
                    }) {
                        Image(systemName: "arrow.right")
                            .imageScale(.large)
                        
                        Text("Sign Up")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Allready you have a ")
                                .foregroundColor(.gray)
                            
                            Text("Account")
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            
                        }
                        .font(.system(size: 14))
                        .padding(.bottom, 40)
                    }
                    .font(.system(size: 10))
                    .frame(maxWidth: .infinity)
                }
                .padding()
            }
        }
    }
}

struct RegistrationsView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationsView()
    }
}
