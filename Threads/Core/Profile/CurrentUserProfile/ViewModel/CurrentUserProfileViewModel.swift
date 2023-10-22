//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Nilay on 21/10/23.
//

import Foundation
import Combine

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancelable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancelable)
    }
}
