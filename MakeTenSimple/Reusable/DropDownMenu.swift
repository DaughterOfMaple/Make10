//
//  DropDownMenu.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 6/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

class DropDownMenu: UIView {

  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    self.frame.size.height = 200
    
    NSLayoutConstraint.activate([
      self.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor),
      self.widthAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.widthAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
