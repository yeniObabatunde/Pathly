//
//  MainBackgroundView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

struct MainBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.95, green: 0.92, blue: 1.0),
                Color(red: 0.98, green: 0.96, blue: 1.0)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    MainBackgroundView()
}
