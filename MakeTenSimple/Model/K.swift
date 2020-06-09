//
//  K.swift
//  TestingCVAgain
//
//  Created by Carly Mapleson on 27/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

struct K {
  struct BrandColors {
    static let purple = UIColor(named: "purple")
    static let purpleAlt = UIColor(named: "purpleAlt")
    static var purpleCG: CGColor = UIColor(named: "purple")!.resolvedColor(with: .current).cgColor
    static let text = UIColor(named: "text")
    static let grey = UIColor(named: "grey")
    static let black = UIColor(named: "grey")
  }
  
  struct Drop {
    static let height: CGFloat = 100
  }
}
