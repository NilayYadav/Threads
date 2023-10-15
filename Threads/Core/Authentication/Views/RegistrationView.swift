//
//  RegistrationView.swift
//  Threads
//
//  Created by Nilay on 15/10/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var username = ""
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
                    TextField("Enter your name", text: $name)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    TextField("Enter your username", text: $username)
                        .modifier(ThreadsTextFieldModifiers())

                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifiers())

                    SecureField("Enter your password", text: $password)
                        .modifier(ThreadsTextFieldModifiers())

                }
                Spacer()

                Button {
                    
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
