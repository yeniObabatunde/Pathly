//
//  PathlyApp.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

@main
struct PathlyApp: App {
    var body: some Scene {
        WindowGroup {
          DashboardView(viewModel: DashboardViewModel(service: MockLearningService()))
        }
    }
}
