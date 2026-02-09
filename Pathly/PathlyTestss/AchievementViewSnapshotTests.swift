//
//  AchievementViewSnapshotTests.swift
//  PathlyTestss
//
//  Created by Sharon Omoyeni Babatunde on 09/02/2026.
//

import SnapshotTesting
import SwiftUI
import XCTest
@testable import Pathly

class AchievementViewSnapshotTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  // MARK: - Default State Tests
  func testAchievementViewDefaultState() {
    let stage = PathStage(
      title: "Git & Version Control",
      subtitle: "Versioned & valiant",
      status: .completed
    )

    let view = AchievementView(stage: stage)

    assertSnapshot(
      view: view,
      name: "default_state",
      contentSizeMode: .screenDimensions
    )
  }

  func testAchievementViewDifferentStageTitle() {
    let stage = PathStage(
      title: "Advanced SwiftUI Patterns",
      subtitle: "Master complex state management and custom layouts",
      status: .completed
    )

    let view = AchievementView(stage: stage)

    assertSnapshot(
      view: view,
      name: "different_title",
      contentSizeMode: .screenDimensions
    )
  }

  func testAchievementViewShortTitle() {
    let stage = PathStage(
      title: "Basics",
      subtitle: "Foundation",
      status: .completed
    )

    let view = AchievementView(stage: stage)

    assertSnapshot(
      view: view,
      name: "short_title",
      contentSizeMode: .screenDimensions
    )
  }

  func testAchievementViewLongTitle() {
    let stage = PathStage(
      title: "Building Enterprise-Grade Mobile Applications with Modern Architecture Patterns",
      subtitle: "Learn to architect scalable applications",
      status: .completed
    )

    let view = AchievementView(stage: stage)

    assertSnapshot(
      view: view,
      name: "long_title",
      contentSizeMode: .screenDimensions
    )
  }
}
