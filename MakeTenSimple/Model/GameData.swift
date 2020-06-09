//
//  GameData.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 3/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import Foundation

struct GameManager {
  var numbersArray = [""]
  var numbersForCalc: [String] {
    var array = [String]()
    for element in numbersArray {
      if element == "^" {
        array.append("**")
      } else {
        array.append(element)
      }
    }
    return array
  }
  let operationsRow1 = ["+", "−", "×", "÷"]
  var operationsRow2 = ["^", "√", "(", "!"]
}


