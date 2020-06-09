//
//  OperationsButton.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 7/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

@IBDesignable class OperationsButton: RoundedButton {
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.backgroundColor = K.BrandColors.grey?.cgColor
    layer.shadowOpacity = 0
    
    titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    titleLabel?.textColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
  }
}
