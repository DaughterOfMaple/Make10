//
//  MakeTenDragAndDrop.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 4/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

//MARK: - CollectionView Drag Delegate Methods
extension MakeTenViewController:  UICollectionViewDragDelegate {
  func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
    // collectionView is always the starting location
    var selectedOperation: String
    
    switch collectionView {
    case numbersCollectionView:
      selectedOperation = gameManager.numbersArray[indexPath.item]
      if selectedOperation.isDigit() {
        return [UIDragItem]()
      }
    case operationsCollectionView:
      selectedOperation = gameManager.operationsArray[indexPath.item]
    default:
      selectedOperation = ""
    }
    
    let itemProvider = NSItemProvider(object: selectedOperation as NSString)
    let dragItem = UIDragItem(itemProvider: itemProvider)
    dragItem.localObject = selectedOperation
    return [dragItem]
  }
  
  func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
    // collectionView is always the starting location
    cameFromNumbers = (collectionView == numbersCollectionView) ? true : false
//    session.
    print("cameFromNumbers: \(cameFromNumbers)")
  }
}

//MARK: - CollectionView Drop Delegate Methods
extension MakeTenViewController: UICollectionViewDropDelegate {
  func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
    // collectionView is always the end location
    switch collectionView {
    case numbersCollectionView:
      if session.localDragSession != nil {
        return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
      } else {
        return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
      }
    default:
      return UICollectionViewDropProposal(operation: .move)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
    // collectionView is always the end location
    guard let item = coordinator.items.first else {
      print("item failed")
      return
    }
    guard let itemText = item.dragItem.localObject as? String  else {
      print("itemText failed")
      return
    }
    let source = item.sourceIndexPath
    
    guard let destination = coordinator.destinationIndexPath else {
      print("destination failed")
      return
    }
    
    switch collectionView {
    case numbersCollectionView:
      if collectionView.hasActiveDrag {
        print("hasdrag")
        collectionView.performBatchUpdates({
          gameManager.numbersArray.remove(at: source!.item)
          gameManager.numbersArray.insert(itemText, at: destination.item)
          collectionView.moveItem(at: source!, to: destination)
        }, completion: nil)
        coordinator.drop(item.dragItem, toItemAt: destination)
      } else {
        print("doesn't have drag, but numbers")
        gameManager.numbersArray.insert(itemText, at: destination.item)
        collectionView.insertItems(at: [destination])
        coordinator.drop(item.dragItem, toItemAt: destination)
        
        print("performdropwith: \(collectionView.cellForItem(at: [0,0])!.reuseIdentifier!)")
      }
    case operationsCollectionView:
      if cameFromNumbers {
        gameManager.numbersArray.remove(at: 0)
//        gameManager.numbersArray.remove(at: )
//        numbersCollectionView.deleteItems(at: )
//        numbersCollectionView.reloadData()
      }
    default:
      print("operationsCV")
      // HOW DO I FIND OUT THE INDEXPATH OF THE STARTING COLLECTIONVIEW??
//      if cameFromNumbers && itemText.isDigit() == false {
//        gameManager.numbersArray.remove(at: )
//        numbersCollectionView.deleteItems(at: )
//        numbersCollectionView.reloadData()
//      }
    }

    
  }
  
  func collectionView(_ collectionView: UICollectionView, dropSessionDidEnd session: UIDropSession) {
    print("dropSessionDidEnd: \(collectionView.cellForItem(at: [0,0])!.reuseIdentifier!)")
  }
}
