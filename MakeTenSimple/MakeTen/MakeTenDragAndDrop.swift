//
//  MakeTenDragAndDrop.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 4/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

//MARK: - CollectionView Drag Delegate Methods
extension MakeTenViewController:  UICollectionViewDragDelegate {
  func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
    // collectionView is always the starting location
    sourceIndex = indexPath.row
    var selectedOperation: String
    
    switch collectionView {
    case numbersCollectionView:
      selectedOperation = gameManager.numbersArray[indexPath.item]
      if selectedOperation.isDigit() {
        return [UIDragItem]()
      }
    case operationsCollectionView:
      selectedOperation = gameManager.operationsArray[indexPath.item]
      if indexPath.item == 10 || indexPath.item == 11 {
        return [UIDragItem]()
      }
    default:
      selectedOperation = ""
    }
    
    let itemProvider = NSItemProvider(object: selectedOperation as NSString)
    let dragItem = UIDragItem(itemProvider: itemProvider)
    dragItem.localObject = selectedOperation
    return [dragItem]
  }
  
  func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
    // NOTE: collectionView is the source collectionView (i.e. the starting point)
    
    // check the starting point
    cameFromNumbers = (collectionView == numbersCollectionView) ? true : false
    cameFromOperations = (collectionView == operationsCollectionView) ? true : false
    
    dragStartPoint = session.location(in: view)
    let locationIndex = collectionView.indexPathForItem(at: dragStartPoint)
    let tappedRow = locationIndex?.item
    print("drag row ending index = \(String(describing: tappedRow))")
    
    guard let selection = tappedRow else {
      print("drag end point is not in a collectionview")
      dragStartPoint = nil
      return
    }
    
    print("Selection is: \(selection)")
  }
  
  func collectionView(_ collectionView: UICollectionView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
    return true
  }
}

//MARK: - CollectionView Drop Delegate Methods
extension MakeTenViewController: UICollectionViewDropDelegate, UIDropInteractionDelegate {
  func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
    // NOTE: collectionView is always the destination
    
    switch collectionView {
    case numbersCollectionView:
      if session.localDragSession != nil {
        return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
      } else {
        return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
      }
//    case operationsCollectionView:
//      return UICollectionViewDropProposal(operation: .move)
    default:
      return UICollectionViewDropProposal(operation: .move)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
    // NOTE: collectionView is always the destination
    guard let item = coordinator.items.first else {
      print("Item failed: no item.")
      return
    }
    guard let itemText = item.dragItem.localObject as? String  else {
      print("Item text failed: LocalObject contains no string.")
      return
    }
    let source = item.sourceIndexPath
    
    switch collectionView {
    case numbersCollectionView:
      if let destination = coordinator.destinationIndexPath {
        if collectionView.hasActiveDrag {
          print("Started on Numbers, ended on Numbers - move.")
          collectionView.performBatchUpdates({
            gameManager.numbersArray.remove(at: source!.item)
            gameManager.numbersArray.insert(itemText, at: destination.item)
            collectionView.moveItem(at: source!, to: destination)
          }, completion: nil)
          coordinator.drop(item.dragItem, toItemAt: destination)
        } else {
          print("Started on Operations, ended on Numbers - copy.")
          gameManager.numbersArray.insert(itemText, at: destination.item)
          collectionView.insertItems(at: [destination])
          coordinator.drop(item.dragItem, toItemAt: destination)
          
          print("performdropwith: \(collectionView.cellForItem(at: [0,0])!.reuseIdentifier!)")
        }
      } else {
        if collectionView.hasActiveDrag {
          print("Started on Numbers, ended on Numbers - move.")
          collectionView.performBatchUpdates({
            gameManager.numbersArray.remove(at: source!.item)
            gameManager.numbersArray.append(itemText)
            collectionView.moveItem(at: source!, to: [0, gameManager.numbersArray.count - 1])
          }) { _ in
            coordinator.drop(item.dragItem, toItemAt: [0, self.gameManager.numbersArray.count - 1])
          }
        } else {
          print("Started on Operations, ended on Numbers - copy.")
          gameManager.numbersArray.append(itemText)
          collectionView.insertItems(at: [[0, gameManager.numbersArray.count - 1]])
          coordinator.drop(item.dragItem, toItemAt: [0, gameManager.numbersArray.count - 1])
          
          print("performdropwith: \(collectionView.cellForItem(at: [0,0])!.reuseIdentifier!)")
        }
      }
    case operationsCollectionView:
      print("Ended on Operations. If came from Numbers, delete from Numbers.")
      if cameFromNumbers && sourceIndex != nil {
          gameManager.numbersArray.remove(at: sourceIndex!)
          numbersCollectionView.reloadData()
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
//    print("dropSessionDidEnd: \(collectionView.cellForItem(at: [0,0])!.reuseIdentifier!)")
  }
  

}
