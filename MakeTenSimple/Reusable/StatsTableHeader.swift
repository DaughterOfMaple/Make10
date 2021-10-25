//
//  StatsTableHeader.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 9/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

class StatsTableHeader: UITableViewHeaderFooterView {
  let title = UILabel()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    clearsContextBeforeDrawing = false
//    backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
