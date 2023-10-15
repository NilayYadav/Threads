//
//  ThreadsTextFieldModifiers.swift
//  Threads
//
//  Created by Nilay on 15/10/23.
//

import Foundation
import SwiftUI

struct ThreadsTextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
}
