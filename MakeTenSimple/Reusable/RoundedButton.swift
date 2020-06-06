//
//  RoundedButton.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 4/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.backgroundColor = K.BrandColors.purple?.cgColor
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 1
    layer.cornerRadius = 15
    
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
    layer.shadowRadius = 1.0
    layer.shadowOpacity = 0.8
    
    titleLabel?.textColor = .white
  }
}
