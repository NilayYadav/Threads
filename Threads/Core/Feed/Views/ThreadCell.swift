//
//  ThreadCell.swift
//  Threads
//
//  Created by Nilay on 20/10/23.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularImageProfileView()
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("batmane")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text("I'm batman, did you watched my movie")
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
    ThreadCell()
}
