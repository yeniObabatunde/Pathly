//
//  HeaderView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

struct HeaderView: View {
  let streak: Int

  var body: some View {
    HStack(spacing: 0) {
      initialsBadge
      Spacer()
      streakBadge
      Spacer()
      settingsButton
    }
  }
}

private extension HeaderView {
  @ViewBuilder
  var initialsBadge: some View {
    Text("TA")
      .font(.system(size: 13, weight: .bold))
      .foregroundColor(.blue)
      .frame(width: 36, height: 36)
      .background(
        Circle()
          .fill(Color.blue.opacity(0.15))
      )
  }

  @ViewBuilder
  var streakBadge: some View {
    HStack(spacing: 6) {
      Text("🔥")
        .font(.system(size: 16))

      Text("\(streak) days")
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(.black)
    }
    .padding(.horizontal, 14)
    .padding(.vertical, 8)
    .background(
      Capsule()
        .fill(Color.orange.opacity(0.12))
    )
  }

  @ViewBuilder
  var settingsButton: some View {
    Image("chatIcon")
      .font(.system(size: 18, weight: .semibold))
      .foregroundColor(.gray.opacity(0.6))
      .frame(width: 36, height: 36)
      .background(
        Circle()
          .fill(Color.gray.opacity(0.08))
      )
  }
}

#Preview {
  HeaderView(streak: 3)
}
