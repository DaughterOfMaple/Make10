//
//  ArrayExtensions.swift
//  TestingCVAgain
//
//  Created by Carly Mapleson on 27/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import Foundation

extension Array where Element == String {
  func asString() -> String {
    return self.joined(separator: " ")
  }
  
  func clean() -> Array {
    var cleanArray = [String]()
    for item in self {
      if Int(item) != nil {
        cleanArray.append(item)
      }
    }
    
    if cleanArray.isEmpty {
      cleanArray = ["?", "?", "?", "?"]
    }
    return cleanArray
  }
}
