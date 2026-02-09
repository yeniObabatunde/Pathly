//
//  PathRepresentable.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

struct PathRepresentable: UIViewControllerRepresentable {
    let stages: [PathStage]
    @Binding var isPresented: Bool
  @State private var selectedStage: PathStage?
      @State private var showAchievementSheet = false

  func makeUIViewController(context: Context) -> LearningPathViewController {
      let vc = LearningPathViewController()
      vc.stages = stages
      vc.dismissAction = context.environment.dismiss
      return vc
  }

  func updateUIViewController(_ uiViewController: LearningPathViewController, context: Context) {
    context.coordinator.isPresented = isPresented
      }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }


}

class Coordinator {
  var isPresented: Bool

  init(_ parent: PathRepresentable) {
    self.isPresented = parent.isPresented
  }
}

