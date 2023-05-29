
import SwiftUI

struct ContactView: View {
    @State private var showNextView = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8431372549, green: 0.7725490196, blue: 0.7019607843, alpha: 1)), Color(#colorLiteral(red: 0.6431372549, green: 0.5725490196, blue: 0.5019607843, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Willkommen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.brown)
                
                Text("\nwir freuen uns sehr sie hier begrüßen zu dürfen")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Text("\nwir zeigen euch heute das Einfach Tierisch Team das wenn ihr was auf dem Herzen habt euch schnell geholfen wird ")
                    .font(.title)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                
                
                Button(action: {
                    self.showNextView = true
                }) {
                    Text("Zum Team")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color.brown)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 50)
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
        }
        .sheet(isPresented: $showNextView) {
            ContactListView(contacts: [
                Contact(name: "Maria Härting", image: "Maria Härting", messageTitle: "Ich bin eurer Ansprechpartner in Rechtsfragen", phoneNumber: "0174 34567899",email: "mariadogs@web.de"),
                Contact(name: "Dirk Slarowski", image: "Dirk Slarowski", messageTitle: "Bittet bei Problemhunden Hilfe an", phoneNumber: "0900 343234567",email: "mariadogs@web.de"),
                Contact(name: "Gina", image: "Gina", messageTitle: "Ernährungsspezialistin ", phoneNumber: "0162 123456",email: "mariadogs@web.de"),
                Contact(name: "Max", image: "Max", messageTitle: "Wesenseinschätzungsfachfrau", phoneNumber: "0170 45234567",email: "mariadogs@web.de"),
                Contact(name: "Heino", image: "Heino", messageTitle: "Fachmann für Adoptionen für Hunde ", phoneNumber: "0162 123273634",email: "mariadogs@web.de"),
                
            ])
        }
    }
}

struct ContactListView: View {
    let contacts: [Contact]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Opening Screen")
                    .resizable()
                    .opacity(0.05)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                List(contacts) { contact in
                    NavigationLink(destination: ContactDetailView(contact: contact)) {
                        HStack {
                            Image(contact.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text(contact.name)
                        }
                    }
                }
               
            }
        }
    }
}
struct ContactDetailView: View {
    let contact: Contact
    @State private var showChatView = false // Add state for showing the ChatView
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8431372549, green: 0.7725490196, blue: 0.7019607843, alpha: 1)), Color(#colorLiteral(red: 0.6431372549, green: 0.5725490196, blue: 0.5019607843, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Image(contact.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    
                    Text(contact.name)
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text(contact.messageTitle)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    
                    // Additional details
                    VStack(alignment: .leading) {
                        Text("Phone Number: \(contact.phoneNumber)")
                            .font(.subheadline)
                        Text("Email: \(contact.email)")
                            .font(.subheadline)
                    }
                    .padding(.vertical)
                    
                    // Additional actions
                    Button(action: {
                        showChatView = true // Show the ChatView
                    }) {
                        Text("Start Chat")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.brown)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                    
                    .sheet(isPresented: $showChatView) {
                        ChatView() // Present the ChatView
                    }
                    
                    Spacer()
                }
            }
            .background(Color.brown)
        }
    }
}

struct Previews_ContactView_Previews: PreviewProvider {
    static var previews: some View {
    ContactView()
    }
}
