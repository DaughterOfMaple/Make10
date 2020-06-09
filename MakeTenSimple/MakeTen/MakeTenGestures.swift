//
//  MakeTenGestures.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 4/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

extension MakeTenViewController: UIGestureRecognizerDelegate {
  func setUpGestureRecognizers() {
    for recognizer in numbersCollectionView.gestureRecognizers! {
      if recognizer.isKind(of: UILongPressGestureRecognizer.self) {
        numberDrag = recognizer as? UILongPressGestureRecognizer
        numberDrag.minimumPressDuration = 0.01
      }
    }
    numberTap = UITapGestureRecognizer(target: self, action: #selector(handleNumberTap(tapGesture:)))
    numbersCollectionView.addGestureRecognizer(numberTap)
    
    for recognizer in operationsCollectionView.gestureRecognizers! {
      if recognizer.isKind(of: UILongPressGestureRecognizer.self) {
        operationDrag = recognizer as? UILongPressGestureRecognizer
        operationDrag.minimumPressDuration = 0.01
      }
    }
  }
  
  @objc func handleNumberTap(tapGesture: UITapGestureRecognizer) {
    let tapPoint = tapGesture.location(in: numbersCollectionView)
    let locationIndex = numbersCollectionView.indexPathForItem(at: tapPoint)
    tappedRow = locationIndex?.item
    
    guard let deletionRow = tappedRow else {
      return
    }
    if gameManager.numbersArray[deletionRow].isDigit() {
      let newValue = Int(gameManager.numbersArray[deletionRow])! * -1
      gameManager.numbersArray[deletionRow] = String(newValue)
    } else {
      gameManager.numbersArray.remove(at: deletionRow)
    }
    numbersCollectionView.reloadData()
  }
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    true
  }
}
