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
    case operationsCollectionView:
      return gameManager.operationsArray.count
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch collectionView {
    case numbersCollectionView:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "numberCell", for: indexPath) as! NumberCell
      cell.label.attributedText = NSAttributedString(
        string: gameManager.numbersArray[indexPath.item],
        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
      return cell
      
    case operationsCollectionView:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "opCell", for: indexPath) as! OperationCell
      cell.label.attributedText = NSAttributedString(
        string: gameManager.operationsArray[indexPath.item],
        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
                     NSAttributedString.Key.foregroundColor: K.BrandColors.text!])
      cell.layer.backgroundColor = K.BrandColors.grey?.resolvedColor(with: .current).cgColor
      
      if indexPath.item == 10 || indexPath.item == 11 {
        cell.layer.backgroundColor = K.BrandColors.purple?.resolvedColor(with: .current).cgColor
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 0.8
        cell.layer.masksToBounds = true
        cell.label.textColor = .white
      }
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
    return 1
  }
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
      return CGSize(width: (labelSize.width + 10), height: collectionHeight)
    }
    
    let cellWidth = (collectionWidth - spacing * 3) / 4
    let cellHeight = (collectionHeight - spacing * 2) / 3
    return CGSize(width: cellWidth, height: cellHeight)
  }
}
