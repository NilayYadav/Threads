//
//  UserService.swift
//  Threads
//
//  Created by Nilay on 21/10/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print(user)
    }
    
    func resetUser() {
        self.currentUser = nil
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentuid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users.filter({ $0.id != currentuid })
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentuid).updateData([
            "profileImageUrl": imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
