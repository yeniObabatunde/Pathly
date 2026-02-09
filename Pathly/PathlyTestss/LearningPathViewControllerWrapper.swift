//
//  LearningPathViewControllerWrapper.swift
//  PathlyTestss
//
//  Created by Sharon Omoyeni Babatunde on 09/02/2026.
//

import SnapshotTesting
import SwiftUI
import XCTest
@testable import Pathly

class LearningPathViewControllerSnapshotTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  // MARK: - Basic Configuration Tests
  func testLearningPathViewControllerDefaultState() {
    let viewController = LearningPathViewController()
    viewController.stages = PathStage.mockStages(count: 4, currentStageIndex: 2)
    viewController.pathTitle = "Fullstack Mobile Engineer"

    let wrapper = LearningPathViewControllerWrapper(viewController: viewController)

    assertSnapshot(
      view: wrapper,
      name: "default_state",
      contentSizeMode: .screenDimensions
    )
  }

  func testLearningPathViewControllerWithMultipleStages() {
    let viewController = LearningPathViewController()
    viewController.stages = PathStage.mockStages(count: 10)

    viewController.pathTitle = "Complete Developer Bootcamp"
    viewController.numberOfCompletedStages = 3

    let wrapper = LearningPathViewControllerWrapper(viewController: viewController)
    assertSnapshot(view: wrapper, name: "multiple_stages", contentSizeMode: .screenDimensions)
  }

  func testLearningPathViewControllerAllCompletedStages() {
    let viewController = LearningPathViewController()
    viewController.stages = [
      PathStage(title: "Swift Basics", subtitle: "Learn Swift", status: .completed),
      PathStage(title: "UIKit Mastery", subtitle: "Master UIKit", status: .completed),
      PathStage(title: "SwiftUI Expert", subtitle: "SwiftUI Pro", status: .completed),
      PathStage(title: "Backend Integration", subtitle: "API calls", status: .completed),
    ]
    viewController.pathTitle = "iOS Development Path"
    viewController.numberOfCompletedStages = 4

    let wrapper = LearningPathViewControllerWrapper(viewController: viewController)

    assertSnapshot(
      view: wrapper,
      name: "all_completed",
      contentSizeMode: .screenDimensions
    )
  }

  // MARK: - Title Length Tests
  func testLearningPathViewControllerShortTitle() {
    let viewController = LearningPathViewController()
    viewController.stages = [
      PathStage(title: "S1", subtitle: "Short", status: .completed),
      PathStage(title: "S2", subtitle: "Short", status: .current),
    ]
    viewController.pathTitle = "iOS"

    let wrapper = LearningPathViewControllerWrapper(viewController: viewController)

    assertSnapshot(
      view: wrapper,
      name: "short_title",
      contentSizeMode: .screenDimensions
    )
  }

  func testLearningPathViewControllerLongTitle() {
    let viewController = LearningPathViewController()
    viewController.stages = [
      PathStage(title: "Stage 1", subtitle: "Introduction", status: .completed),
      PathStage(title: "Stage 2", subtitle: "Advanced Topics", status: .current),
    ]
    viewController.pathTitle = "Becoming a Fullstack Mobile Engineer: From Basics to Advanced Patterns and Best Practices"

    let wrapper = LearningPathViewControllerWrapper(viewController: viewController)

    assertSnapshot(
      view: wrapper,
      name: "long_title",
      contentSizeMode: .screenDimensions
    )
  }

  // MARK: - Progress Indicator Tests
  func testLearningPathViewControllerEarlyProgress() {
    let viewController = LearningPathViewController()
    viewController.stages = PathStage.mockStages(count: 5, currentStageIndex: 1, subtitle: "Step")
    viewController.numberOfCompletedStages = 1

    let wrapper = LearningPathViewControllerWrapper(viewController: viewController)

    assertSnapshot(
      view: wrapper,
      name: "early_progress",
      contentSizeMode: .screenDimensions
    )
  }

  func testLearningPathViewControllerMidwayProgress() {
    let viewController = LearningPathViewController()
    let totalStages = 8
    viewController.stages = Array(0..<totalStages).map { index in
      let status: StageStatus
      if index < 4 {
        status = .completed
      } else if index == 4 {
        status = .current
      } else {
        status = .locked
      }
      return PathStage(
        title: "Stage \(index + 1)",
        subtitle: "Progress: \(Int(Double(index + 1) / Double(totalStages) * 100))%",
        status: status
      )
    }
    viewController.pathTitle = "Midway Through Path"
    viewController.numberOfCompletedStages = 4

    let wrapper = LearningPathViewControllerWrapper(viewController: viewController)
    
    assertSnapshot(
      view: wrapper,
      name: "midway_progress",
      contentSizeMode: .screenDimensions
    )
  }

  func testLearningPathViewControllerAlmostComplete() {
    let viewController = LearningPathViewController()
    viewController.stages = PathStage.mockStages(count: 6, currentStageIndex: 5, subtitle: "Almost there!")
    viewController.numberOfCompletedStages = 5

    let wrapper = LearningPathViewControllerWrapper(viewController: viewController)

    assertSnapshot(
      view: wrapper,
      name: "almost_complete",
      contentSizeMode: .screenDimensions
    )
  }

}
