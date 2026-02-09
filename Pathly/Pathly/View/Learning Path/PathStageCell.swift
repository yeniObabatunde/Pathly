//
//  PathStageCell.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import UIKit

class PathStageCell: UICollectionViewCell {
  lazy var iconView = UIImageView()
  lazy var titleLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    contentView.addSubview(iconView)
    contentView.addSubview(titleLabel)

    iconView.contentMode = .scaleAspectFit
    iconView.translatesAutoresizingMaskIntoConstraints = false

    titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    titleLabel.textColor = .black
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 2
    titleLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      iconView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      iconView.widthAnchor.constraint(equalToConstant: 82),
      iconView.heightAnchor.constraint(equalToConstant: 72),

      titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
    ])
  }

  func configure(with stage: PathStage) {
    titleLabel.text = stage.title
    let iconSize: CGFloat

    switch stage.status {
      case .completed:
        iconView.image = UIImage(named: "achievmentBadge3")
        iconSize = 72
      case .current:
        iconView.image = UIImage(named: "inProgressBadge")
        iconSize = 92
      case .locked:
        iconView.image = UIImage(named: "circleGreyed")
        iconSize = 92
    }

    updateIconSize(iconSize)
  }

  private func updateIconSize(_ newSize: CGFloat) {
    iconView.constraints.forEach { constraint in
      if constraint.firstAttribute == .width || constraint.firstAttribute == .height {
        constraint.isActive = false
      }
    }

    NSLayoutConstraint.activate([
      iconView.widthAnchor.constraint(equalToConstant: newSize),
      iconView.heightAnchor.constraint(equalToConstant: newSize - 20)
    ])
  }
}
