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
    
    var selectedOperation: String = ""
    
    if collectionView == numbersCollectionView {
      selectedOperation = gameManager.numbersArray[indexPath.item]
    }
    else if collectionView == operationsCollectionViewRow1 {
      selectedOperation = gameManager.operationsRow1[indexPath.item]
    }
    else if collectionView == operationsCollectionViewRow2 {
      selectedOperation = gameManager.operationsRow2[indexPath.item]
    }
    
    if Int(selectedOperation) != nil {
      return [UIDragItem]()
    }
    
    let itemProvider = NSItemProvider(object: selectedOperation as NSString)
    let dragItem = UIDragItem(itemProvider: itemProvider)
    dragItem.localObject = selectedOperation
    
    return [dragItem]
  }
}

//MARK: - CollectionView Drop Delegate Methods
extension MakeTenViewController: UICollectionViewDropDelegate {
  func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
    
    if session.localDragSession != nil {
      if collectionView == numbersCollectionView && destinationIndexPath != nil {
        
        if collectionView.hasActiveDrag {
          return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
        
      }
        
      else if collectionView == operationsCollectionViewRow1 || collectionView == operationsCollectionViewRow2 {
        return UICollectionViewDropProposal(operation: .move, intent: .unspecified)
      }
      return UICollectionViewDropProposal(operation: .cancel)
    }
    
    return UICollectionViewDropProposal(operation: .forbidden)
  }
  
  func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
    
    let item = coordinator.items.first!
    let source = item.sourceIndexPath
    let destination = coordinator.destinationIndexPath
    
    if coordinator.proposal.operation == .move {
      if collectionView == numbersCollectionView && collectionView.hasActiveDrag {
        collectionView.performBatchUpdates({
          gameManager.numbersArray.remove(at: source!.item)
          gameManager.numbersArray.insert(item.dragItem.localObject as! String, at: destination!.item)
          collectionView.moveItem(at: source!, to: destination!)
        }, completion: nil)
        coordinator.drop(item.dragItem, toItemAt: destination!)
      }
      else if collectionView == operationsCollectionViewRow1 || collectionView == operationsCollectionViewRow2 {
        numbersCollectionView.performBatchUpdates({
          gameManager.numbersArray.remove(at: source!.item)
          numbersCollectionView.deleteItems(at: [source!])
          print("move")
        }, completion: nil)
      }
    }
    else if coordinator.proposal.operation == .copy {
      if let item = coordinator.items.first {
        collectionView.performBatchUpdates({
          gameManager.numbersArray.insert(item.dragItem.localObject as! String, at: destination!.item)
          collectionView.insertItems(at: [destination!])
        }, completion: nil)
        coordinator.drop(item.dragItem, toItemAt: destination!)
        print("copy")
      }
    }
  }
}
