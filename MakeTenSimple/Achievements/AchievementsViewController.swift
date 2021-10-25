//
//  StatsViewController.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 31/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    
//    let viewBackground = Gradient(superView: view)
//    viewBackground.add(to: view)
//    viewBackground.add(to: self.tabBarController!.tabBar)
  }
}

//MARK: - AchievementsViewController Delegate and DelegateFlowLayout Methods
extension AchievementsViewController: UICollectionViewDelegate { }
extension AchievementsViewController: UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collectionWidth = collectionView.bounds.width
    let spacing: CGFloat = 20  // why?
    
    let cellWidth = (collectionWidth - spacing * 4) / 3
    let cellHeight = cellWidth

    return CGSize(width: cellWidth, height: cellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
  }
}

//MARK: - AchievementsViewController DataSource Methods
extension AchievementsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 15
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "badgeCell", for: indexPath) as! BadgeCell
    cell.label.text = "Badge \(indexPath.item + 1)"
    cell.backgroundColor = .red
    return cell
  }
}
