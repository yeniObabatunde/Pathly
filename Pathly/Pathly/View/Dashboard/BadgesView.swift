//
//  BadgesView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

struct BadgesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            title
            badgesRow
        }
    }

      @ViewBuilder
      var title: some View {
          Text("Badges")
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.black)
      }

      @ViewBuilder
      var badgesRow: some View {
          HStack(spacing: 16) {
              ForEach(Badge.allCases, id: \.self) { badge in
                  badgeItem(for: badge)
              }
          }
      }
  }


private extension BadgesView {
    @ViewBuilder
    func badgeItem(for badge: Badge) -> some View {
        VStack(spacing: 8) {
            BadgeIcon(badge: badge)
                .frame(height: 80)

            VStack(spacing: 2) {
                Text(badge.title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)

                Text(badge.subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.gray.opacity(0.6))
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}


struct BadgeIcon: View {
  let badge: Badge

  var body: some View {
    Image(badge.imageName)
      .resizable()
      .scaledToFit()
  }
}

#Preview {
  BadgesView()
}
