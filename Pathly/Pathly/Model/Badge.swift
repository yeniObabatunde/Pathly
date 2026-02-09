//
//  Badge.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 09/02/2026.
//

import Foundation

enum Badge: CaseIterable {
  case genius
  case speedster
  case perfectionist

  var title: String {
    switch self {
    case .genius: "Genius"
    case .speedster: "Speedster"
    case .perfectionist: "Perfectionist"
    }
  }

  var subtitle: String {
    switch self {
    case .genius: "3/3 perfect scores"
    case .speedster: "5 correct in a row"
    case .perfectionist: "100% accuracy"
    }
  }

  var imageName: String {
    switch self {
    case .genius: "achievmentBadge1"
    case .speedster: "achievmentBadge2"
    case .perfectionist: "achievmentBadge3"
    }
  }
}
