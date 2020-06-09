//
//  CheckButton.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 7/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

@IBDesignable class CheckButton: RoundedButton {
  override func layoutSubviews() {
      super.layoutSubviews()
    
    
      
//      layer.backgroundColor = K.BrandColors.grey?.cgColor
//      layer.borderColor = UIColor.black.cgColor
//      layer.borderWidth = 1
//      layer.cornerRadius = 15
      
//      layer.shadowColor = UIColor.darkGray.cgColor
//      layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
//      layer.shadowRadius = 1.0
    layer.shadowOpacity = 0.8
      
    
    titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    
    
    
    }
}
