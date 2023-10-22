//
//  ProfileHeaderView.swift
//  Threads
//
//  Created by Nilay on 22/10/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            CircularImageProfileView()
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.shared.user)
}
