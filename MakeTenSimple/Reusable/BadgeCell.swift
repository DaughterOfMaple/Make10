//
//  BadgeCell.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 9/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

class BadgeCell: UICollectionViewCell {
  var label = UILabel()
  
  override func layoutSubviews() {
    layer.cornerRadius = 15
    layer.borderWidth = 1
    layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    layer.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
    layer.masksToBounds = false
    
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
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
    ])
  }
}
