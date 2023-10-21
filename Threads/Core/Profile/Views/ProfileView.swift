//
//  ProfileView.swift
//  Threads
//
//  Created by Nilay on 18/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                            }
                            
                            if let bio = currentUser?.bio {
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
                    
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                    }
                    
                    LazyVStack {
                        ForEach (0 ... 10, id: \.self) { thread in
                           ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    ProfileView()
}
