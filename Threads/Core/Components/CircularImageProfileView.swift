//
//  CircularImageProfileView.swift
//  Threads
//
//  Created by Nilay on 20/10/23.
//

import SwiftUI

struct CircularImageProfileView: View {
    var body: some View {
        Image("batman")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(.circle)
    }
}

#Preview {
    CircularImageProfileView()
}
