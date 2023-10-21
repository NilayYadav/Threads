//
//  AuthService.swift
//  Threads
//
//  Created by Nilay on 21/10/23.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print(result.user.uid)
        } catch {
            print("Fail to create user with error \(error.localizedDescription)")
        }
    }
    
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullName: fullName, username: username, id: result.user.uid)
            print(result.user.uid)
        } catch {
            print("Fail to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.resetUser()
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String, fullName: String, username: String, id: String) async throws {
        
        let user = User(id: id, fullname: fullName, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
