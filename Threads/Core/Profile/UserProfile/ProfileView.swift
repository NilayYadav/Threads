//
//  ProfileView.swift
//  Threads
//
//  Created by Nilay on 18/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                UserContentListView(user: user)
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
        }
    }
}
#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
