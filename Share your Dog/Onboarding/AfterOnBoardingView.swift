
import SwiftUI


struct AfterOnBoarding: View {
    
    @AppStorage("onBoarding") var onBoarding = false
    
    @State private var showLoginView = false
    @State private var showRegisterView = false
    
    var body: some View {
        
        VStack {
            // Header: Explore
            VStack {
                Text("DOGGYBOOK")
                    .font(.custom("Playfairdisplay-Bold", size: 60))
                    .foregroundColor(.brown)
                    .padding(.bottom, 30)
            }
            .padding(.top, 100)
            
            // Body: Domingo
            VStack {
                Spacer()
                
                Image("DOMINGO")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .blur(radius: 0.5)
                    .opacity(1.05)
                    .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                    .padding(.bottom, 90)
                
                Spacer()
            }
            
            // Footer: Buttons
            VStack {
                // Login Button
                Button(action: {
                    self.showLoginView = true
                }, label: {
                    Text("Anmelden")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(10)
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 300)
                .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                .padding(.bottom, 20)
                .sheet(isPresented: $showLoginView) {
                    LoginView()
                }
                
                // Register Button
                Button(action: {
                    self.showRegisterView = true
                }, label: {
                    Text("Registrieren")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(10)
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 300)
                .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                .padding(.bottom, 20)
                .sheet(isPresented: $showRegisterView) {
                    RegistrationsView()
                }
            }
            .padding(.bottom, 80)
        }
        .background(
            Image("background3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.4)
        )
    }
}
