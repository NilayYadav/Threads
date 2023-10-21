//
//  LoginViewModel.swift
//  Threads
//
//  Created by Nilay on 21/10/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""

    @MainActor
    func loginUser() async throws {
        print("Login user")
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
    }
}
