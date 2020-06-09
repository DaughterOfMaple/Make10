//
//  GradientColor.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 6/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

class Gradient {
  let superView: UIView
  var gradientLayer : CAGradientLayer {
    let gradient = CAGradientLayer()
    gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradient.frame = superView.bounds
    gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
    return gradient
  }
  init(in view: UIView) {
    superView = view
  }
  
  func add(to button: UIButton) {
    button.layer.addSublayer(gradientLayer)
    button.layer.masksToBounds = true
  }
}



//
//struct GradientColor {
//  func addGradient(to item: UIView, in superView: UIView) {
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//    gradientLayer.frame = superView.bounds
//    gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
//    item.layer.insertSublayer(gradientLayer, at: 0)
//  }
//
//  func add(to item: UIButton, in superView: UIView) {
////    let itemOrigin = item.frame.origin
////    let superViewOrigin = superView.frame.origin
////
////    print("\(item.titleLabel!.text!) button, item origin:  \(itemOrigin)")
////    print("\(item.titleLabel!.text!) button, super origin:  \(superViewOrigin)")
////
////    let offsetX = superViewOrigin.x - itemOrigin.x
////    let offsetY = superViewOrigin.y - itemOrigin.y
////
////    print("\(item.titleLabel!.text!) button, offsetY:  \(offsetY)")
////    print("\(item.titleLabel!.text!) button, offsetX:  \(offsetX)")
//////
////    let gradientLayer = CAGradientLayer()
////    gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
////    gradientLayer.frame = superView.frame
////    print("\(item.titleLabel!.text!) button, superview frame:  \(superView.frame)")
////    print("\(item.titleLabel!.text!) button, item frame:  \(item.frame)")
////    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
////    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
////
//////    gradientLayer.transform = CATransform3DMakeTranslation(offsetX, offsetY, 0)
////    gradientLayer.transform = CATransform3DMakeTranslation((-item.frame.origin.x), (-item.frame.origin.y), 0)
////    item.layer.insertSublayer(gradientLayer, at: 0)
////
////    item.layer.masksToBounds = true
//    let itemOrigin = item.frame.origin
//    let superViewOrigin = superView.frame.origin
//
//    let offsetX = superViewOrigin.x - itemOrigin.x
//    let offsetY = superViewOrigin.y - itemOrigin.y
//
//    print(offsetX)
//    print(offsetY)
//
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.frame = superView.bounds
//    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//    gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
//    gradientLayer.transform = CATransform3DMakeTranslation(offsetX, offsetY, 0)
//    item.layer.insertSublayer(gradientLayer, at: 0)
//    item.layer.masksToBounds = true
//  }
//
//  func addGradient(to item: UITabBar, in superView: UIView) {
//    let itemOrigin = item.frame.origin
//    let superViewOrigin = superView.frame.origin
//
//    let offsetX = superViewOrigin.x - itemOrigin.x
//    let offsetY = superViewOrigin.y - itemOrigin.y
//
//    print(offsetX)
//    print(offsetY)
//
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.frame = superView.bounds
//    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//    gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
//    gradientLayer.transform = CATransform3DMakeTranslation(offsetX, offsetY, 0)
//    item.layer.insertSublayer(gradientLayer, at: 0)
//    item.layer.masksToBounds = true
//  }
//
//  func addGradient(to item: UICollectionViewCell, in superView: UIView) {
//    let itemOrigin = item.frame.origin
//    let superViewOrigin = superView.frame.origin
//
//    let offsetX = superViewOrigin.x - itemOrigin.x
//    let offsetY = superViewOrigin.y - itemOrigin.y
//
//
//    print(offsetX)
//    print(offsetY)
//
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.frame = superView.bounds
//    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//    gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
//    gradientLayer.transform = CATransform3DMakeTranslation(offsetX, offsetY, 0)
//    item.layer.insertSublayer(gradientLayer, at: 0)
//    item.layer.masksToBounds = true
//  }
//}
