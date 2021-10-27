//
//  GradientColor.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 6/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

struct Gradient {
  let superView: UIView
  
  func add(to item: UIView) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = superView.bounds
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
    item.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  func add(to item: UITabBar) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = superView.bounds
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
    gradientLayer.transform = CATransform3DMakeTranslation((-item.frame.origin.x), (-item.frame.origin.y), 0)
    item.layer.insertSublayer(gradientLayer, at: 0)
    item.layer.masksToBounds = true
  }
}
