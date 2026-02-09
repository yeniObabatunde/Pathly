//
//  DashboardViewSnapshotTests.swift
//  PathlyTestss
//
//  Created by Sharon Omoyeni Babatunde on 09/02/2026.
//

import SnapshotTesting
import SwiftUI
import XCTest
@testable import Pathly

class DashboardViewSnapshotTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  // MARK: - Default State Tests

  func testDashboardViewDefaultState() {
    let mockService = MockLearningService()
    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "default_state",
      contentSizeMode: .screenDimensions
    )
  }

  func testDashboardViewWithMultipleCompletedStages() {
    let mockService = MockLearningService()
    mockService.stages = [
      PathStage(title: "Programming Basics", subtitle: "Learn the fundamentals", status: .completed),
      PathStage(title: "UI Development", subtitle: "Master UIKit and SwiftUI", status: .completed),
      PathStage(title: "Backend Integration", subtitle: "Connect your apps", status: .current),
      PathStage(title: "Testing & Debugging", subtitle: "Quality assurance", status: .locked),
    ]

    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "multiple_completed_stages",
      contentSizeMode: .screenDimensions
    )
  }

  func testDashboardViewMixedStageStates() {
    let mockService = MockLearningService()
    mockService.stages = [
      PathStage(title: "Getting Started", subtitle: "Welcome aboard", status: .completed),
      PathStage(title: "Swift Fundamentals", subtitle: "Core concepts", status: .completed),
      PathStage(title: "SwiftUI Basics", subtitle: "Modern UI toolkit", status: .current),
      PathStage(title: "Advanced Patterns", subtitle: "Design patterns", status: .locked),
      PathStage(title: "Mobile Architecture", subtitle: "Scalable apps", status: .locked),
    ]

    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "mixed_stage_states",
      contentSizeMode: .screenDimensions
    )
  }

  // MARK: - Content Size Mode Tests
  func testDashboardViewIntrinsicHeight() {
    let mockService = MockLearningService()
    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "intrinsic_height",
      contentSizeMode: .intrinsicHeight
    )
  }

  // MARK: - High Streak Test
  func testDashboardViewWithHighStreak() {
    let mockService = MockLearningService()
    mockService.streak = 42

    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "high_streak",
      contentSizeMode: .screenDimensions
    )
  }

  func testDashboardViewWithZeroStreak() {
    let mockService = MockLearningService()
    mockService.streak = 0

    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "zero_streak",
      contentSizeMode: .screenDimensions
    )
  }

  // MARK: - Empty State Test
  func testDashboardViewNoStages() {
    let mockService = MockLearningService()
    mockService.stages = []

    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "no_stages",
      contentSizeMode: .screenDimensions
    )
  }

  // MARK: - Single Stage Tests
  func testDashboardViewSingleCompletedStage() {
    let mockService = MockLearningService()
    mockService.stages = [
      PathStage(title: "Swift Basics", subtitle: "Learn the fundamentals", status: .completed),
    ]

    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "single_completed_stage",
      contentSizeMode: .screenDimensions
    )
  }

  func testDashboardViewSingleCurrentStage() {
    let mockService = MockLearningService()
    mockService.stages = [
      PathStage(title: "SwiftUI Essentials", subtitle: "Modern UI toolkit", status: .current),
    ]

    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)
    
    assertSnapshot(
      view: view,
      name: "single_current_stage",
      contentSizeMode: .screenDimensions
    )
  }

  // MARK: - Delayed Rendering Tests
  func testDashboardViewWithDelay() {
    let mockService = MockLearningService()
    let viewModel = DashboardViewModel(service: mockService)
    let view = DashboardView(viewModel: viewModel)

    assertSnapshot(
      view: view,
      name: "with_delay",
      contentSizeMode: .screenDimensions, delay: 0.5
    )
  }
}
