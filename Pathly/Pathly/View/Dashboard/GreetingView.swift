//
//  GreetingView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

struct GreetingView: View {
  let greeting: String
  @State private var isFlipped = false
  
  var body: some View {
    VStack(alignment: .center, spacing: 12) {
      leadingIcon
      greetingText
      trailingView
    }
  }
}

private extension GreetingView {
  @ViewBuilder
  var leadingIcon: some View {
    VStack {
      Image("mascot")
        .resizable()
        .rotation3DEffect(.degrees(isFlipped ? 360 : 0), axis: (x: 0, y: 1, z: 0))
        .onAppear {
          withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
            isFlipped = true
          }
        }
        .frame(width: 126, height: 173, alignment: .center)
    }
    .frame(height: 120)
    .frame(maxWidth: .infinity)
  }

  @ViewBuilder
  var greetingText: some View {
    Text(greeting)
      .font(.system(size: 28, weight: .bold))
      .foregroundColor(.black)
  }

  @ViewBuilder
  var trailingView: some View {
    HStack(spacing: 2) {
      Text("You're closer than you think")
        .font(.system(size: 15, weight: .regular))
        .foregroundColor(.gray.opacity(0.8))

      Text("💪")
        .font(.system(size: 14))
    }
  }
}

#Preview {
  GreetingView(greeting: "Good day")
}
