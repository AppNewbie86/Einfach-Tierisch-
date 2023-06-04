
import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        VStack {
            Text("Anmelden")
                .font(.custom("Playfairdisplay-Regular", size: 45))
                .fontWeight(.bold)
                .padding(.top, 20)
                .foregroundColor(.brown)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

struct LoginBodyView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        VStack {
            InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                .foregroundColor(.white)
                .autocapitalization(.none)
                .padding(.horizontal, 20)
            
            InputView(text: $password, title: "Password", placeholder: "Enter your Password", isSecureField: true)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

struct LoginFooterView: View {
    @Binding var isShowingForgotPassword: Bool
    @Binding var isShowingForgotEmail: Bool
    @EnvironmentObject var authService: AuthService
    
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                isShowingForgotPassword = true
            }) {
                Text("Forgot Password")
                    .foregroundColor(.white)
                    .underline()
            }
            
            Button(action: {
                isShowingForgotEmail = true
            }) {
                Text("Forgot Email")
                    .foregroundColor(.white)
                    .underline()
            }
            
            Spacer()
            
            Button(action: {
                // Sign In action
                Task {
                    authService.signIn(email: email, password: password)
                }
            }) {
                HStack {
                    Text("Anmelden")
                        .fontWeight(.bold)
                    
                    Image(systemName: "arrow.right")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.brown)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.35), radius: 8, x: 2, y: 6)
            }
            .padding(.horizontal, 40)
            
            NavigationLink(destination: RegistrationsView()) {
                HStack(spacing: 3) {
                    Text("Don't have an account")
                        .foregroundColor(.white)
                    
                    Text("Registrieren")
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                .font(.system(size: 14))
                .padding(.bottom, 40)
            }
        }
        .padding(.bottom, 40)
    }
}

struct LoginView: View {
    @State private var isShowingForgotPassword = false
    @State private var isShowingForgotEmail = false
    
    var body: some View {
        NavigationStack {
            VStack {
                LoginHeaderView()
                LoginBodyView()
                LoginFooterView(isShowingForgotPassword: $isShowingForgotPassword, isShowingForgotEmail: $isShowingForgotEmail)
            }
            .padding(.all)
            .background(
                Image("background3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.4)
            )
        }
        .sheet(isPresented: $isShowingForgotPassword) {
            ForgotPasswordView()
        }
        .sheet(isPresented: $isShowingForgotEmail) {
            ForgotEmailView()
        }
    }
}


struct ForgotPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var isShowingConfirmationAlert = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Password vergessen ?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                .foregroundColor(.black)
                .autocapitalization(.none)
                .padding(.horizontal, 10)
            
            Button(action: {
                // Send Password Reset action
                showConfirmationAlert()
                dismiss()
            }) {
                Text("Send Password Reset")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            
            Button(action: {
                dismiss()
            }) {
                Text("Abbrechen")
                    .foregroundColor(.red)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color("Bg"))
        .alert(isPresented: $isShowingConfirmationAlert) {
            confirmationAlert
        }
    }
    
    func showConfirmationAlert() {
        isShowingConfirmationAlert = true
        
        // Schließe den Alert nach 2 Sekunden
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isShowingConfirmationAlert = false
        }
    }
    
    var confirmationAlert: Alert {
        Alert(title: Text("Danke, dass Sie uns Ihren Namen gegeben haben"),
              message: Text("Wir schicken Ihnen umgehend eine Email zur Bestätigung zu"),
              dismissButton: .default(Text("OK")))
    }
}

struct ForgotEmailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var fullname = ""
    @State private var isShowingConfirmationAlert = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Benutzername vergessen ?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            InputView(text: $fullname, title: "Full Name", placeholder: "Enter your Name")
                .foregroundColor(.black)
                .padding(.horizontal, 10)
            
            Button(action: {
                // Send Email Reset action
                showConfirmationAlert()
                dismiss()
            }) {
                Text("Send Email Reset")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            
            Button(action: {
                dismiss()
            }) {
                Text("Abbrechen")
                    .foregroundColor(.red)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color("Bg"))
        .alert(isPresented: $isShowingConfirmationAlert) {
            confirmationAlert
        }
    }
    
    func showConfirmationAlert() {
        isShowingConfirmationAlert = true
        
        // Schließe den Alert nach 2 Sekunden
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isShowingConfirmationAlert = false
        }
    }
    
    var confirmationAlert: Alert {
        Alert(title: Text("Danke, dass Sie uns Ihren Namen gegeben haben"),
              message: Text("Wir schicken Ihnen umgehend eine Email zur Bestätigung zu"),
              dismissButton: .default(Text("OK")))
    }
}
