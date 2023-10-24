//
//  PreviewProvider.swift
//  Threads
//
//  Created by Nilay on 22/10/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Nilay Yadav", email: "test@gmail.com", username: "nilay_y11")
    
    let thread = Thread(ownerUid: "123", caption: "Hello, Test Thread", timestamp: Timestamp(), likes: 1)
}
