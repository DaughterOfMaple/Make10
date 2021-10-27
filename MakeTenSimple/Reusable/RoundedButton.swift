//
//  RoundedButton.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 4/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.backgroundColor = K.BrandColors.buttonPurple?.cgColor
//    layer.borderColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    layer.borderWidth = 1
    layer.cornerRadius = 15
    
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
    layer.shadowRadius = 1.0
    layer.shadowOpacity = 0.8
    
    titleLabel?.textColor = .white
  }
}
