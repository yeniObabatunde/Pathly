//
//  AchievementView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

let customPurple = Color(red: 0.525, green: 0.212, blue: 0.910)

struct AchievementView: View {
    let stage: PathStage
    @State private var isFlipped = false
    @State private var showShareSheet = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            bottomSheet
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(items: ["I just mastered \(stage.title)! 🎉"])
        }
    }
}

private extension AchievementView {
  @ViewBuilder
  var bottomSheet: some View {
    VStack(spacing: 0) {
      topBar
      content
    }
    .background(Color.white)
    .cornerRadius(20, corners: [.topLeft, .topRight])
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .ignoresSafeArea()
  }

  @ViewBuilder
  var topBar: some View {
    VStack(spacing: 12) {
      RoundedRectangle(cornerRadius: 2.5)
        .fill(Color.gray.opacity(0.4))
        .frame(width: 40, height: 5)
        .padding(.top, 12)

      Button(action: flipBadge) {
        HStack(spacing: 6) {
          Image(systemName: "arrow.2.squarepath")
            .font(.system(size: 13, weight: .semibold))
          Text("Flip badge")
            .font(.system(size: 13, weight: .semibold))
        }
        .foregroundColor(.gray)
      }
      .padding(.top, 6)
    }
    .frame(maxWidth: .infinity)
    .background(Color.white)
  }

  @ViewBuilder
  var content: some View {
    VStack(spacing: 24) {
      badgeSection
      titleText
      descriptionText
      shareButton
      closeButton
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 32)
    .frame(maxWidth: .infinity)
    .background(Color.white)
  }

  @ViewBuilder
  var badgeSection: some View {
    Image("achievmentBadge3")
      .resizable()
      .scaledToFit()
      .frame(width: 180, height: 180)
      .rotation3DEffect(
        .degrees(isFlipped ? 180 : 0),
        axis: (x: 1, y: 0, z: 0)
      )
      .animation(.easeInOut(duration: 0.6), value: isFlipped)
      .frame(maxWidth: .infinity)
  }

  @ViewBuilder
  var titleText: some View {
    Text("\(stage.title) mastery earned")
      .font(.system(size: 18, weight: .bold))
      .foregroundColor(.black)
      .multilineTextAlignment(.center)
      .lineLimit(2)
  }

  @ViewBuilder
  var descriptionText: some View {
    Text(stage.subtitle + ". You don't just write code. You commit to it.")
      .font(.system(size: 14))
      .foregroundColor(.gray)
      .multilineTextAlignment(.center)
      .lineLimit(3)
  }

  @ViewBuilder
  var shareButton: some View {
    Button(action: { showShareSheet = true }) {
      Text("Share your achievement")
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .background(customPurple)
        .cornerRadius(12)
    }
    .padding(.top, 8)
  }

  @ViewBuilder
  var closeButton: some View {
    Button(action: { dismiss() }) {
      Text("Close")
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(.gray)
    }
  }
}

private extension AchievementView {
    func flipBadge() {
        withAnimation(.easeInOut(duration: 0.6)) {
            isFlipped.toggle()
        }
    }
}


#Preview {
  AchievementView(
    stage: PathStage(
      title: "Git & Version Control",
      subtitle: "Versioned & valiant",
      status: .completed
    )
  )
}
