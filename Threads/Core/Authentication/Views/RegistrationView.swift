//
//  RegistrationView.swift
//  Threads
//
//  Created by Nilay on 15/10/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            VStack {
                Spacer()

                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your name", text: $viewModel.name)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    TextField("Enter your username", text: $viewModel.username)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifiers())

                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifiers())

                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifiers())

                }
                Spacer()

                Button {
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 54)
                    .background(.gray)
                    .cornerRadius(8)
                }
                .padding(.vertical)
                
                Spacer()
                
                Divider( )
                
                Button {
                   dismiss()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account")
                        
                        Text("Login")
                        .fontWeight(.semibold)

                    }
                    .font(.footnote)
                    .padding(.vertical, 16)
                    .foregroundColor(.black)

                }
                .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
