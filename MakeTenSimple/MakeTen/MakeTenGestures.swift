//
//  MakeTenGestures.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 4/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

extension MakeTenViewController: UIGestureRecognizerDelegate {
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
  
  func setUpGestureRecognizers() {
    numberTap = UITapGestureRecognizer()
    numberTap.addTarget(self, action: #selector(handleNumberTap(tapGesture:)))
    numberTap.numberOfTapsRequired = 1
    numbersCollectionView.addGestureRecognizer(numberTap)
    
    for recognizer in numbersCollectionView.gestureRecognizers! {
      if recognizer.isKind(of: UILongPressGestureRecognizer.self) {
        numberDrag = recognizer as? UILongPressGestureRecognizer ?? UILongPressGestureRecognizer()
        numberDrag.minimumPressDuration = 0.01
        
      }
      if recognizer.isKind(of: UITapGestureRecognizer.self) {
        recognizer.shouldRequireFailure(of: numberTap)
      }
    }
    
    operationTap = UITapGestureRecognizer()
    operationTap.addTarget(self, action: #selector(handleOperationsTap(tapGesture:)))
    operationTap.numberOfTapsRequired = 1
    operationsCollectionView.addGestureRecognizer(operationTap)
    
    for recognizer in operationsCollectionView.gestureRecognizers! {
      if recognizer.isKind(of: UILongPressGestureRecognizer.self) {
        operationDrag = recognizer as? UILongPressGestureRecognizer ?? UILongPressGestureRecognizer()
        operationDrag.minimumPressDuration = 0.01
      }
      if recognizer.isKind(of: UITapGestureRecognizer.self) {
        recognizer.shouldRequireFailure(of: operationTap)
      }
    }
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
    let tapPoint = tapGesture.location(in: operationsCollectionView)
    let locationIndex = operationsCollectionView.indexPathForItem(at: tapPoint)
    let tappedRow = locationIndex?.item
    
    guard let selection = tappedRow else {
      return
    }
    if selection == 10 {
      clearButtonClicked()
    }
    if selection == 11 {
      checkButtonClicked()
    }
  }
  
  func clearButtonClicked() {
    print("clear button clicked")
    gameManager.numbersArray = gameManager.numbersArray.clean()
    numbersCollectionView.reloadData()
  }
  
  func checkButtonClicked() {
    print("check button clicked")
    do {
      result = try Calculator.evaluate(gameManager.numbersForCalc)
      result == 10.0 ? timeManager.stopTimer() : nil
      let response = ResponseManager.provideCustomFeedback(for: result ?? 0)
      resultLabel.text = "\(response) You made: \(result?.round(to: 2) ?? 0.00)"
    } catch {
      print("String for calc \(gameManager.numbersForCalc)")
      let err = ErrorManager.customOutput(for: error)
      let alert = UIAlertController(title: "Error", message: err, preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .default, handler: nil)
      alert.addAction(action)
      present(alert, animated: true)
    }
  }
}
