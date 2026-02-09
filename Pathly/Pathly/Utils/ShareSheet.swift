//
//  ShareSheet.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 09/02/2026.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
  let items: [Any]

  func makeUIViewController(context: Context) -> UIActivityViewController {
    return UIActivityViewController(activityItems: items, applicationActivities: nil)
  }

  func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
