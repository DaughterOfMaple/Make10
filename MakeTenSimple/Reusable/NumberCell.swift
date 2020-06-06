//
//  NumberCell.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 31/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {
  var label = UILabel()
  
  override func layoutSubviews() {
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = K.BrandColors.text
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.sizeToFit()
    
//    label.textAlignment = .center

    self.addSubview(label)
    
    NSLayoutConstraint.activate([
      NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: label, attribute: .centerX, multiplier: 1, constant: 0),
      NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: label, attribute: .centerY, multiplier: 1, constant: 0)
    ])
  }
}
