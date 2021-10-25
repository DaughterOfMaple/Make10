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
        numberDrag.cancelsTouchesInView = false
      }
      if recognizer.isKind(of: UITapGestureRecognizer.self) {
        numberTap = recognizer as? UITapGestureRecognizer
        numberTap.addTarget(self, action: #selector(handleNumberTap(tapGesture:)))
      }
    }
    
//    numberTap = UITapGestureRecognizer(target: self, action: #selector(handleNumberTap(tapGesture:)))
//    numbersCollectionView.addGestureRecognizer(numberTap)
    
    for recognizer in operationsCollectionView.gestureRecognizers! {
      if recognizer.isKind(of: UILongPressGestureRecognizer.self) {
        operationDrag = recognizer as? UILongPressGestureRecognizer
        operationDrag.minimumPressDuration = 0.01
        operationDrag.cancelsTouchesInView = false
      }
      if recognizer.isKind(of: UITapGestureRecognizer.self) {
        operationTap = recognizer as? UITapGestureRecognizer
        operationTap.addTarget(self, action: #selector(handleOperationsTap(tapGesture:)))
      }
    }
//    operationTap = UITapGestureRecognizer(target: self, action: #selector(handleOperationsTap(tapGesture:)))
//    operationsCollectionView.addGestureRecognizer(operationTap)
  }
  
  @objc func handleNumberTap(tapGesture: UITapGestureRecognizer) {
    let tapPoint = tapGesture.location(in: numbersCollectionView)
    let locationIndex = numbersCollectionView.indexPathForItem(at: tapPoint)
    let tappedRow = locationIndex?.item
    print("tapped row: \(String(describing: tappedRow))")
    guard let selectedRow = tappedRow else {
      return
    }
    if gameManager.numbersArray[selectedRow].isDigit() {
      let newValue = Int(gameManager.numbersArray[selectedRow])! * -1
      gameManager.numbersArray[selectedRow] = String(newValue)
      print("tapped number, index: \(String(describing: tappedRow))")
    } else {
      print("tapped operation")
      gameManager.numbersArray.remove(at: selectedRow)
    }
    numbersCollectionView.reloadData()
  }
  
  @objc func handleOperationsTap(tapGesture: UITapGestureRecognizer) {
    let tapPoint = tapGesture.location(in: numbersCollectionView)
    let locationIndex = numbersCollectionView.indexPathForItem(at: tapPoint)
    let tappedRow = locationIndex?.item
    
    guard let selection = tappedRow else {
      return
    }
    if selection == 10 {
      print("clear")
      resetButtonClicked()
    }
    if selection == 11 {
      print("check")
      checkButtonClicked()
    }
  }
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    true
  }
}
