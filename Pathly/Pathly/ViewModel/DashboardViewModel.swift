//
//  DashboardViewModel.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import Foundation
import Combine

protocol DashboardViewModelProtocol: ObservableObject {
    var greeting: String { get }
    var streak: Int { get }
    var stages: [PathStage] { get }
}

class DashboardViewModel: DashboardViewModelProtocol {
    @Published var greeting: String = ""
    @Published var streak: Int = 0
    @Published var stages: [PathStage] = []

    init(service: LearningServiceProtocol) {
        self.streak = service.getStreak()
        self.stages = service.fetchPath()
        updateGreeting()
    }

    private func updateGreeting() {
        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 0..<12:
            greeting = "Good morning Yeni!"
        case 12..<17:
            greeting = "Good afternoon Yeni!"
        default:
            greeting = "Good evening Yeni!"
        }
    }
}
