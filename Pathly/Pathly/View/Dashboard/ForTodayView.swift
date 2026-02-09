//
//  ForTodayView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

struct ForTodayView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            title
            todayCard
        }
    }
}

private extension ForTodayView {
  @ViewBuilder
  var title: some View {
    Text("For today")
      .font(.system(size: 16, weight: .semibold))
      .foregroundColor(.black)
  }

  @ViewBuilder
  var todayCard: some View {
    HStack(spacing: 12) {
      icon
      lessonInfo
      Spacer()
      chevron
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 14)
    .background(cardBackground)
  }
}

private extension ForTodayView {
  @ViewBuilder
  var icon: some View {
    Image("circleGreyed")
      .resizable()
      .font(.system(size: 20))
      .foregroundColor(.gray.opacity(0.6))
      .frame(width: 44, height: 44)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.gray.opacity(0.08))
      )
  }

  @ViewBuilder
  var lessonInfo: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text("Build a login screen in React")
        .font(.system(size: 15, weight: .semibold))
        .foregroundColor(.black)

      HStack(spacing: 4) {
        Image("calendar")
          .font(.system(size: 11))
          .foregroundColor(.gray)

        Text("Component lifecycle")
          .font(.system(size: 13))
          .foregroundColor(.gray.opacity(0.7))
      }
    }
  }

  @ViewBuilder
  var chevron: some View {
    Image(systemName: "chevron.right")
      .font(.system(size: 13, weight: .semibold))
      .foregroundColor(.gray.opacity(0.5))
  }

  var cardBackground: some View {
    RoundedRectangle(cornerRadius: 16)
      .fill(Color.white)
      .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 2)
  }
}

#Preview {
    ForTodayView()
}
