//
//  UploadView.swift
//  Threads
//
//  Created by Nilay on 18/10/23.
//

import SwiftUI

struct ThreadCreation: View {
    
    @State private var text = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularImageProfileView()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Brucne Veans")
                            .fontWeight(.semibold)
                        
                        TextField("Start Thread...", text: $text, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !text.isEmpty  {
                        Button {
                            text = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Add Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        
                    }
                    .opacity(text.isEmpty ? 0.5 : 1.0)
                    .disabled(text.isEmpty)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    ThreadCreation()
}
