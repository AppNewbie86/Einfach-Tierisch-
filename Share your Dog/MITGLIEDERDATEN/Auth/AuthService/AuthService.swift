

import SwiftUI
import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth

// Die Klasse AuthService ist eine ObservableObject-Klasse, die verschiedene Methoden zur Verwaltung der Authentifizierungsfunktionen enthält
final class AuthService: ObservableObject {
    
    // Die Eigenschaft "user" ist ein optionaler User und wird aktualisiert, wenn sich der Authentifizierungszustand ändert
    @Published var user: User?
    
    // Methode, um einen Listener für Änderungen des Authentifizierungszustands hinzuzufügen
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            if let user = user {
                self.user = User(id: user.uid, fullname: user.displayName ?? "", age: 34, email: user.email ?? "", userName: "")
            } else {
                self.user = nil
            }
        }
    }
    
    // Methode, um einen neuen Benutzer mit einer E-Mail-Adresse und einem Passwort zu registrieren
    func signUp(email: String, password: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                print("Fehler beim Registrieren des Benutzers: \(error.localizedDescription)")
                return
            }
            
            if let user = result?.user {
                self.user = User(id: user.uid, fullname: fullname, age: 34, email: email, userName: "")
                self.saveUserToFirestore(user: self.user!)
            }
        }
    }
    
//    func resetPassword(email: String) async throws {
//        try.await; Auth.auth().sendPasswordReset(withEmail: email)
//    }
//    
    // Methode, um einen registrierten Benutzer mit einer E-Mail-Adresse und einem Passwort anzumelden
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                print("Fehler beim Anmelden des Benutzers: \(error.localizedDescription)")
                return
            }
            
            if let user = result?.user {
                self.user = User(id: user.uid, fullname: user.displayName ?? "", age: 34, email: user.email ?? "", userName: "")
            }
        }
    }
    
    // Methode, um einen angemeldeten Benutzer abzumelden
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch let error {
            print("Fehler beim Abmelden des Benutzers: \(error.localizedDescription)")
        }
    }
    
    // Methode, um den Benutzer in Firestore zu speichern
    private func saveUserToFirestore(user: User) {
        do {
            let encodedUser = try Firestore.Encoder().encode(user)
            Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("Fehler beim Speichern des Benutzers in Firestore: \(error.localizedDescription)")
        }
    }
}

