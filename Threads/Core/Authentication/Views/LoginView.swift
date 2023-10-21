//
//  LoginView.swift
//  Threads
//
//  Created by Nilay on 15/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifiers())

                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifiers())
                }
                
                NavigationLink {
                     Text("Forgot password")
                } label: {
                     Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.black)
                }

                Button {
                    Task { try await viewModel.loginUser() }
                } label: {
                     Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 54)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account")
                        
                        Text("Sign Up")   
                        .fontWeight(.semibold)

                    }
                    .font(.footnote)
                    .padding(.vertical, 16)
                    .foregroundColor(.black)

                }
            }
        }
    }
}

#Preview {
    LoginView()
}
