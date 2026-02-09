//
//  LearningModel.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI
import Combine

enum StageStatus { case completed, current, locked }

struct PathStage: Identifiable, Hashable {
  let id = UUID()
  let title: String
  let subtitle: String
  let status: StageStatus
}

protocol LearningServiceProtocol {
  func fetchPath() -> [PathStage]
  func getStreak() -> Int
}

class MockLearningService: LearningServiceProtocol {
  var stages: [PathStage] = []
  var streak: Int = 3

  init() {
    setupDefaultData()
  }

  private func setupDefaultData() {
    stages = [
      PathStage(
        title: "Programming Basics",
        subtitle: "Fundamentals",
        status: .completed
      ),
      PathStage(
        title: "Git & Version Control",
        subtitle: "Mastery",
        status: .completed
      ),
      PathStage(
        title: "Learn React",
        subtitle: "Component Lifecycle",
        status: .completed
      ),
      PathStage(
        title: "Core Mobile UI",
        subtitle: "Layouts",
        status: .current
      ),
      PathStage(
        title: "Access Device Features",
        subtitle: "Fundamentals",
        status: .locked
      ),
    ]
  }

  func fetchPath() -> [PathStage] {
    return stages
  }

  func getStreak() -> Int {
    return streak
  }
}


#if DEBUG
extension PathStage {
  static func mockStages(
    count: Int,
    currentStageIndex: Int? = nil,
    subtitle: String = "Subtitle"
  ) -> [PathStage] {
    return (0..<count).map { index in
      let status: StageStatus
      if let currentIdx = currentStageIndex {
        if index < currentIdx {
          status = .completed
        } else if index == currentIdx {
          status = .current
        } else {
          status = .locked
        }
      } else {
        status = .locked
      }

      return PathStage(
        title: "Stage \(index + 1)",
        subtitle: "\(subtitle) for stage \(index + 1)",
        status: status
      )
    }
  }
}
#endif
