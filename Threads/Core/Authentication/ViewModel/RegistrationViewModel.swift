//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Nilay on 21/10/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        print("create user")
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullName: name,
            username: username
        )
    }
}
