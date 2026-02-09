//
//  DashboardView.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel: DashboardViewModel
    @State private var showingPath = false

    var body: some View {
        ZStack(alignment: .top) {
            gradientBackground
            scrollContent
        }
        .fullScreenCover(isPresented: $showingPath) {
            PathRepresentable(stages: viewModel.stages, isPresented: $showingPath)
        }
    }
}

private extension DashboardView {
  @ViewBuilder
  var gradientBackground: some View {
    MainBackgroundView()
      .ignoresSafeArea()
      .frame(height: 360)
  }

  @ViewBuilder
  var scrollContent: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 0) {
        topSection
        bottomSection
      }
    }
  }

  @ViewBuilder
  var topSection: some View {
    VStack(alignment: .leading, spacing: 0) {
      HeaderView(streak: viewModel.streak)
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .padding(.bottom, 16)

      GreetingView(greeting: viewModel.greeting)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)

      ForTodayView()
        .padding(.horizontal, 20)
        .padding(.bottom, 32)
    }
  }

  @ViewBuilder
  var bottomSection: some View {
    VStack(alignment: .leading, spacing: 0) {
      ActiveLearningPathView(
        stages: viewModel.stages,
        showingPath: $showingPath
      )
      .padding(.horizontal, 20)
      .padding(.top, 12)
      .padding(.bottom, 28)

      BadgesView()
        .padding(.horizontal, 20)
        .padding(.bottom, 60)
    }
    .background(Color.white)
  }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let mockService = MockLearningService()
        let viewModel = DashboardViewModel(service: mockService)
        DashboardView(viewModel: viewModel)
    }
}
