//
//  HistoryCellTableViewCell.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 9/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
  
  @IBOutlet weak var randomIdentifier: UIImageView!
  @IBOutlet weak var labelLeft: UILabel!
  @IBOutlet weak var labelRight: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  @IBAction func shareButtonClicked(_ sender: UIButton) {
  }
  
//  override func prepareForReuse() {
//    layer.cornerRadius = 0
//  }
}
