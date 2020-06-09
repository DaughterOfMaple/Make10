//
//  Button.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 7/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

extension UIButton {
    func addGradient(toMatch superView: UIView) {
      let itemOrigin = self.frame.origin
      let superViewOrigin = superView.frame.origin

      print("\(self.titleLabel!.text!) button, item origin:  \(itemOrigin)")
      print("\(self.titleLabel!.text!) button, super origin:  \(superViewOrigin)")

      let offsetX = superViewOrigin.x - itemOrigin.x
      let offsetY = superViewOrigin.y - itemOrigin.y

      print("\(self.titleLabel!.text!) button, offsetY:  \(offsetY)")
      print("\(self.titleLabel!.text!) button, offsetX:  \(offsetX)")
  //
      let gradientLayer = CAGradientLayer()
      gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
      gradientLayer.frame = superView.frame
      print("\(self.titleLabel!.text!) button, superview frame:  \(superView.frame)")
      print("\(self.titleLabel!.text!) button, item frame:  \(self.frame)")
      gradientLayer.startPoint = CGPoint(x: 0, y: 0)
      gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
      
  //    gradientLayer.transform = CATransform3DMakeTranslation(offsetX, offsetY, 0)
      gradientLayer.transform = CATransform3DMakeTranslation((-self.frame.origin.x), (-self.frame.origin.y), 0)
      self.layer.insertSublayer(gradientLayer, at: 0)
      
      self.layer.masksToBounds = true
    }
}
