//
//  ThreadCell.swift
//  Threads
//
//  Created by Nilay on 20/10/23.
//

import SwiftUI

struct ThreadCell: View {
    
    var thread: Thread
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularImageProfileView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                                .foregroundColor(Color(.darkGray))
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                                .foregroundColor(Color(.darkGray))
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                                .foregroundColor(Color(.darkGray))
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                }
            }
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell(thread: DeveloperPreview().thread)
}
