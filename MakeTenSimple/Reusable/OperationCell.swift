//
//  OperationCell.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 31/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

class OperationCell: UICollectionViewCell {
  
  var label = UILabel()
  
  override func layoutSubviews() {
    layer.cornerRadius = 15
    layer.borderWidth = 1
    layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
//    layer.backgroundColor = K.BrandColors.grey?.resolvedColor(with: .current).cgColor
    
    layer.masksToBounds = false
//    layer.shadowColor = UIColor.darkGray.cgColor
//    layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
//    layer.shadowRadius = 1.0
//    layer.shadowOpacity = 0.8
    
//    label.textColor = K.BrandColors.text
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//    label.sizeToFit()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    
//    label.backgroundColor = .red
//    layer.backgroundColor = UIColor.blue.cgColor
    
    self.addSubview(label)
    
    NSLayoutConstraint.activate([
      NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: label, attribute: .top, multiplier: 1, constant: -5),
      NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 5),
      NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: label, attribute: .right, multiplier: 1, constant: 5),
      NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: label, attribute: .left, multiplier: 1, constant: -5)
      
//      NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: label, attribute: .centerX, multiplier: 1, constant: 0),
//      NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: label, attribute: .centerY, multiplier: 1, constant: 0)
    ])
  }
}
