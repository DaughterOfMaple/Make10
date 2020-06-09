//
//  StatsViewController.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 31/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {  
  override func viewDidLoad() {
    super.viewDidLoad()
    let viewBackground = Gradient(superView: view)
    viewBackground.add(to: view)
    viewBackground.add(to: self.tabBarController!.tabBar)
  }
}
