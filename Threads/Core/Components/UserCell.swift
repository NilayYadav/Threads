//
//  UserCell.swift
//  Threads
//
//  Created by Nilay on 20/10/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularImageProfileView()
            
            VStack(alignment: .leading) {
                Text("Batman")
                    .fontWeight(.semibold)
                
                Text("Bruce Vean")
                    .font(.footnote)
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
