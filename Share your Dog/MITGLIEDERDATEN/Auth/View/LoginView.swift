import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authService: AuthService
    
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Opening Screen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 16) {
                    Spacer().frame(height: 50)
                    
                    Text("Tierisch")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.vertical, 32)
                    
                    Image("LogoLinks")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 32)
                    
                    VStack(spacing: 16) {
                        InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                            .autocapitalization(.none)
                            .padding(.horizontal, 40)
                        
                        InputView(text: $password, title: "Password", placeholder: "Enter your Password", isSecureField: true)
                            .padding(.horizontal, 40)
                    }
                    .padding(.top, 12)
                    
                    Button(action: {
//                        withAnimation {
//                           // playSound(sound: "success", type: "m4a")
//                            Task {
//                                try await authService.signIn(email: email, password: password)
//                            }
//                        }
                    }) {
                        HStack {
                            Text("Sign In")
                                .fontWeight(.bold)
                            
                            Image(systemName: "arrow.right")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.brown)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 40)
                    
                    NavigationLink(destination: RegistrationsView()) {
                        HStack(spacing: 3) {
                            Text("Don't have an account")
                                .foregroundColor(.gray)
                            
                            Text("Sign up")
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                        .font(.system(size: 14))
                        .padding(.bottom, 40)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            openURL("https://www.facebook.com")
                        }) {
                            Image(systemName: "square.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                        }
                        
                        Button(action: {
                            openURL("https://www.twitter.com")
                        }) {
                            Image(systemName: "square.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                        }
                        
                        Button(action: {
                            openURL("https://www.instagram.com")
                        }) {
                            Image(systemName: "square.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
        }
    }
}
