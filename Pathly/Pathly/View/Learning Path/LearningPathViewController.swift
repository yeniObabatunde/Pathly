//
//  LearningPathViewController.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import UIKit
import SwiftUI

class LearningPathViewController: UIViewController {

  var stages: [PathStage] = []
  var pathTitle: String = "Fullstack mobile engineer path"
  var numberOfCompletedStages: Int = 2
  var dismissAction: DismissAction?

  lazy var backgroundPathView: LearningPathBackgroundView = {
    let backgroundPathView = LearningPathBackgroundView()
    backgroundPathView.frame = view.bounds
    backgroundPathView.isUserInteractionEnabled = false
    return backgroundPathView
  }()

  private let backButton = UIButton()
  private let pageLabel = UILabel()
  private let titleLabel = UILabel()
  private let subtitleLabel = UILabel()

  private lazy var collectionView: UICollectionView = {
    let layout = PathFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .clear
    cv.register(PathStageCell.self, forCellWithReuseIdentifier: "StageCell")
    cv.dataSource = self
    cv.delegate = self
    cv.showsHorizontalScrollIndicator = false
    cv.alwaysBounceHorizontal = true
    cv.isScrollEnabled = true
    cv.isUserInteractionEnabled = true
    return cv
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    let completedCount = stages.filter { $0.status == .completed }.count
    numberOfCompletedStages = completedCount
    setupUI()
    navigationController?.setNavigationBarHidden(true, animated: false)
    collectionView.allowsSelection = true
    collectionView.isUserInteractionEnabled = true
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    backgroundPathView.frame = collectionView.bounds
    updatePathPoints()
  }

  private func setupUI() {
    view.backgroundColor = UIColor(white: 0.98, alpha: 1.0)

    collectionView.addSubview(backgroundPathView)
    backgroundPathView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    view.addSubview(collectionView)
    setupHeader()

    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor
        .constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

  private func setupHeader() {
    backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
    backButton.tintColor = .black
    backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    backButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(backButton)

    pageLabel.text = "Stage \(numberOfCompletedStages + 1) of \(stages.count)"
    pageLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    pageLabel.textColor = .systemGray
    pageLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pageLabel)

    titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    titleLabel.textColor = .black
    titleLabel.text = pathTitle
    titleLabel.numberOfLines = 0
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(titleLabel)

    subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    subtitleLabel.textColor = .systemGray
    subtitleLabel.numberOfLines = 1
    subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(subtitleLabel)

    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      backButton.widthAnchor.constraint(equalToConstant: 28),
      backButton.heightAnchor.constraint(equalToConstant: 28),

      pageLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 8),
      pageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

      titleLabel.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 4),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
      subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
    ])
  }

  @objc private func backButtonTapped() {
    dismissAction?.callAsFunction()
  }

  private func updatePathPoints() {
    guard let layout = collectionView.collectionViewLayout as? PathFlowLayout,
          !layout.cellCenters.isEmpty else { return }

    let sortedCenters = layout.cellCenters
      .sorted(by: { $0.key < $1.key })
      .map { $0.value }

    backgroundPathView.points = sortedCenters

    let completedIndices = stages.enumerated()
      .filter { $0.element.status == .completed }
      .map { $0.offset }
    backgroundPathView.completedIndices = completedIndices
  }
}

extension LearningPathViewController: UICollectionViewDataSource, UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return stages.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StageCell", for: indexPath) as! PathStageCell
    cell.configure(with: stages[indexPath.item])
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let stage = stages[indexPath.item]
    if stage.status == .completed {
      let achievementView = AchievementView(stage: stage)
      let hostingController = UIHostingController(rootView: achievementView)
      hostingController.modalPresentationStyle = .pageSheet
      hostingController.view.backgroundColor = .clear
      present(hostingController, animated: true, completion: nil)
    }
  }
}

#if DEBUG
struct LearningPathViewControllerWrapper: View {
  let viewController: LearningPathViewController

  var body: some View {
    LearningPathViewControllerRepresentable(viewController: viewController)
      .ignoresSafeArea()
  }
}

struct LearningPathViewControllerRepresentable: UIViewControllerRepresentable {
  let viewController: LearningPathViewController

  func makeUIViewController(context: Context) -> LearningPathViewController {
    return viewController
  }

  func updateUIViewController(_ uiViewController: LearningPathViewController, context: Context) {}
}
#endif
