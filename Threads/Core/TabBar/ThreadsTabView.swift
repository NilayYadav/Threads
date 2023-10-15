//
//  ThreadsTabView.swift
//  Threads
//
//  Created by Nilay on 15/10/23.
//

import SwiftUI

struct ThreadsTabView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Feeds")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ?.fill : .none)
                }
            
            Text("Explore")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        
                }
            
            Text("Upload")
                .tabItem {
                    Image(systemName: "plus")
                        
            }
            
            Text("Heart")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ?.fill : .none)
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ?.fill : .none)
                }

        }
    }
}

#Preview {
    ThreadsTabView()
}
