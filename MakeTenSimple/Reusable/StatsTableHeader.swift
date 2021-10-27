//
//  StatsTableHeader.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 9/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

class StatsTableHeader: UITableViewHeaderFooterView {
  let title = UILabel()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    self.backgroundView = UIView(frame: self.bounds)
    self.backgroundView?.backgroundColor = UIColor(white: 0.5, alpha: 0)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
