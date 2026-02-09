//
//  ActiveLearningPathView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

struct ActiveLearningPathView: View {
  let stages: [PathStage]
  @Binding var showingPath: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Active learning path")
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(.black)

      currentLearningPath
      learningPath
      fullPathButton
    }
  }
}

private extension ActiveLearningPathView {
  @ViewBuilder
  var currentLearningPath: some View {
    VStack(alignment: .leading, spacing: 8) {
      VStack(alignment: .leading, spacing: 2) {
        Text("Fullstack Mobile Engineer")
          .font(.system(size: 15, weight: .semibold))
          .foregroundColor(.black)

        HStack(spacing: 12) {
          Text("Stage 3 of 11")
            .font(.system(size: 13))
            .foregroundColor(.gray.opacity(0.7))

          ProgressView(value: 3, total: 11)
            .tint(customPurple)
            .frame(width: 120, height: 6)
        }
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 14)
    }
  }

  @ViewBuilder
  var learningPath: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack(spacing: 12) {
        Image("achievmentBadge1")
          .resizable()
          .frame(width: 50, height: 50)
          .foregroundColor(.blue.opacity(0.8))

        VStack(alignment: .leading, spacing: 2) {
          Text("Learn React")
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.black)

          Text("Component lifecycle")
            .font(.system(size: 13))
            .foregroundColor(.gray.opacity(0.7))
        }

        Spacer()
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 14)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.white)
          .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 2)
      )
    }
  }

  @ViewBuilder
  var fullPathButton: some View {
    Button(action: { showingPath = true }) {
      HStack(spacing: 6) {
        Text("View full path")
          .font(.system(size: 16, weight: .semibold))

        Image(systemName: "arrow.right")
          .font(.system(size: 14, weight: .semibold))
      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .frame(height: 48)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(
            customPurple
          )
      )
    }
  }
}

#Preview {
  ActiveLearningPathView(
    stages: [
      .init(title: "This", subtitle: "that too", status: .completed)
    ],
    showingPath: .constant(true)
  )
}
