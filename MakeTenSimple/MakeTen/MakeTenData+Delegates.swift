//
//  MakeTenDataSource.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 31/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

//MARK: - CollectionView DataSource Methods
extension MakeTenViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    switch collectionView {
    case numbersCollectionView:
      return gameManager.numbersArray.count
    case operationsCollectionViewRow1:
      return gameManager.operationsRow1.count
    case operationsCollectionViewRow2:
      return gameManager.operationsRow2.count
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch collectionView {
    case numbersCollectionView:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "numberCell", for: indexPath) as! NumberCell
      cell.label.attributedText = NSAttributedString(string: gameManager.numbersArray[indexPath.item], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
        
      return cell
    case operationsCollectionViewRow1:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "opCell", for: indexPath) as! OperationCell
      cell.label.text = gameManager.operationsRow1[indexPath.item]
      return cell
    case operationsCollectionViewRow2:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "opCell", for: indexPath) as! OperationCell
      cell.label.text = gameManager.operationsRow2[indexPath.row]
      return cell
    default:
      let cell = UICollectionViewCell()
      return cell
    }
  }
}

//MARK: - CollectionView Delegate FlowLayout Methods
extension MakeTenViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  
  
//  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//      guard let superAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
//      // Copy each item to prevent "UICollectionViewFlowLayout has cached frame mismatch" warning
//      guard let attributes = NSArray(array: superAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
//
//      // Constants
//      let leftPadding: CGFloat = 8
//      let interItemSpacing = minimumInteritemSpacing
//
//      // Tracking values
//      var leftMargin: CGFloat = leftPadding // Modified to determine origin.x for each item
//      var maxY: CGFloat = -1.0 // Modified to determine origin.y for each item
//      var rowSizes: [[CGFloat]] = [] // Tracks the starting and ending x-values for the first and last item in the row
//      var currentRow: Int = 0 // Tracks the current row
//      attributes.forEach { layoutAttribute in
//
//          // Each layoutAttribute represents its own item
//          if layoutAttribute.frame.origin.y >= maxY {
//
//              // This layoutAttribute represents the left-most item in the row
//              leftMargin = leftPadding
//
//              // Register its origin.x in rowSizes for use later
//              if rowSizes.count == 0 {
//                  // Add to first row
//                  rowSizes = [[leftMargin, 0]]
//              } else {
//                  // Append a new row
//                  rowSizes.append([leftMargin, 0])
//                  currentRow += 1
//              }
//          }
//
//          layoutAttribute.frame.origin.x = leftMargin
//
//          leftMargin += layoutAttribute.frame.width + interItemSpacing
//          maxY = max(layoutAttribute.frame.maxY, maxY)
//
//          // Add right-most x value for last item in the row
//          rowSizes[currentRow][1] = leftMargin - interItemSpacing
//      }
//
//      // At this point, all cells are left aligned
//      // Reset tracking values and add extra left padding to center align entire row
//      leftMargin = leftPadding
//      maxY = -1.0
//      currentRow = 0
//      attributes.forEach { layoutAttribute in
//
//          // Each layoutAttribute is its own item
//          if layoutAttribute.frame.origin.y >= maxY {
//
//              // This layoutAttribute represents the left-most item in the row
//              leftMargin = leftPadding
//
//              // Need to bump it up by an appended margin
//              let rowWidth = rowSizes[currentRow][1] - rowSizes[currentRow][0] // last.x - first.x
//              let appendedMargin = (collectionView!.frame.width - leftPadding  - rowWidth - leftPadding) / 2
//              leftMargin += appendedMargin
//
//              currentRow += 1
//          }
//
//          layoutAttribute.frame.origin.x = leftMargin
//
//          leftMargin += layoutAttribute.frame.width + interItemSpacing
//          maxY = max(layoutAttribute.frame.maxY, maxY)
//      }
//
//      return attributes
//  }
}

//MARK: - CollectionView Delegate Methods
extension MakeTenViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let collectionWidth = collectionView.bounds.width
    let collectionHeight = collectionView.bounds.height
    let spacing: CGFloat = 15  // why?
    
    if collectionView == numbersCollectionView {
      let size = CGSize(width: 20, height: 20)
      let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
      let labelSize = NSString(string: gameManager.numbersArray[indexPath.item]).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
      return CGSize(width: (labelSize.width), height: collectionHeight - 5)
    }
    
    let cellWidth = (collectionWidth - spacing * 3) / 4
    return CGSize(width: cellWidth, height: collectionHeight - 5)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 5)
  }
  
}
