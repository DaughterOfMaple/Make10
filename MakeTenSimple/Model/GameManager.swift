//
//  GameManager.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 3/6/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import Foundation

enum GameMode {
  case classic
  case timeChallenge
}

struct GameManager {
  var gameMode: GameMode = .classic
  
  var numbersArray = ["?", "?", "?", "?"]
  
  var numbersForCalc: [String] {
    var array = [String]()
    for element in numbersArray {
      if element == "^" {
        array.append("**")
      } else {
        array.append(element)
      }
    }
    return array.reversed()
  }
  
  let operationsArray = ["+", "−", "×", "÷", "^", "√(", "(", ")", "!", "ln", "Clear", "Check"]
}
