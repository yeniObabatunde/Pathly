//
//  LearningPathBackgroundView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 09/02/2026.
//

import SwiftUI
class LearningPathBackgroundView: UIView {

  var points: [CGPoint] = [] {
    didSet {
      updatePath()
    }
  }

  var completedIndices: [Int] = [] {
    didSet {
      updatePath()
    }
  }

  private var shapeLayer: CAShapeLayer?

  private func updatePath() {
    shapeLayer?.removeFromSuperlayer()
    shapeLayer = nil

    guard points.count >= 2 else { return }

    let completedPath = UIBezierPath()
    let incompletePath = UIBezierPath()

    for i in 1..<points.count {
      let prev = points[i-1]
      let curr = points[i]

      let isConnectionCompleted = completedIndices.contains(i-1) && completedIndices.contains(i)

      let midY = (prev.y + curr.y) / 2
      let control1 = CGPoint(
        x: prev.x + (curr.x - prev.x) * 0.4,
        y: midY - 30 * (i % 2 == 0 ? 1 : -1)
      )
      let control2 = CGPoint(
        x: prev.x + (curr.x - prev.x) * 0.6,
        y: midY + 30 * (i % 2 == 0 ? 1 : -1)
      )

      let segment = UIBezierPath()
      segment.move(to: prev)
      segment.addCurve(to: curr, controlPoint1: control1, controlPoint2: control2)

      if isConnectionCompleted {
        completedPath.append(segment)
      } else {
        incompletePath.append(segment)
      }
    }

    if !completedPath.isEmpty {
      let completedLayer = CAShapeLayer()
      completedLayer.path = completedPath.cgPath
      completedLayer.strokeColor = UIColor.systemGray3.withAlphaComponent(0.8).cgColor
      completedLayer.fillColor = UIColor.clear.cgColor
      completedLayer.lineWidth = 2.5
      completedLayer.lineCap = .round
      completedLayer.lineJoin = .round
      layer.addSublayer(completedLayer)
    }

    if !incompletePath.isEmpty {
      let incompleteLayer = CAShapeLayer()
      incompleteLayer.path = incompletePath.cgPath
      incompleteLayer.strokeColor = UIColor.systemGray3.withAlphaComponent(0.5).cgColor
      incompleteLayer.fillColor = UIColor.clear.cgColor
      incompleteLayer.lineWidth = 2.5
      incompleteLayer.lineDashPattern = [7, 5]
      incompleteLayer.lineCap = .round
      incompleteLayer.lineJoin = .round
      layer.addSublayer(incompleteLayer)
    }
  }

}
