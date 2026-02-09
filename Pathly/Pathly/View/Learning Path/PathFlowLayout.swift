//
//  PathFlowLayout.swift
//  Pathly
//
//  Created by Sharon Omoyeni Babatunde on 08/02/2026.
//

import UIKit

class PathFlowLayout: UICollectionViewFlowLayout {

  var cellCenters: [Int: CGPoint] = [:]
  private let itemWidth: CGFloat = 120
  private let itemHeight: CGFloat = 140
  private let horizontalSpacing: CGFloat = 40
  private let verticalSpacing: CGFloat = 80

  override func prepare() {
    super.prepare()
    itemSize = CGSize(width: itemWidth, height: itemHeight)
    minimumLineSpacing = verticalSpacing
    minimumInteritemSpacing = horizontalSpacing
    sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
    cellCenters.removeAll()
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }

    cellCenters.removeAll()
    for attr in attributes {
      let row = attr.indexPath.item
      let positionInCycle = row % 4
      let isRight = positionInCycle == 1 || positionInCycle == 2

      let contentWidth = collectionView?.bounds.width ?? 0
      let leftX = sectionInset.left + itemWidth / 2
      let rightX = contentWidth - sectionInset.right - itemWidth / 2

      attr.center.x = isRight ? rightX : leftX
      cellCenters[row] = attr.center
    }
    return attributes
  }

  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    guard let attr = super.layoutAttributesForItem(at: indexPath) else { return nil }

    let row = indexPath.item
    let isRight = row % 2 != 0
    let contentWidth = collectionView?.bounds.width ?? 0
    let leftX = sectionInset.left + itemWidth / 2
    let rightX = contentWidth - sectionInset.right - itemWidth / 2

    attr.center.x = isRight ? rightX : leftX

    return attr
  }
}
