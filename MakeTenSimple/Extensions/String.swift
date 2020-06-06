//
//  Extensions.swift
//  TestingCVAgain
//
//  Created by Carly Mapleson on 24/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import Foundation

extension String {
  func isDigit() -> Bool {
    var digitTrue = false
    if Double(self) != nil {
      digitTrue = true
    }
    return digitTrue
  }
  
  func asArray() -> [String] {
    return self.components(separatedBy: " ")
  }
}
