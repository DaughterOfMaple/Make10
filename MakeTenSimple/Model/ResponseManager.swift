//
//  ResponseManager.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 6/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import Foundation

struct ResponseManager {
  static private let successfulResponses = [
    "Great work!",
    "Woohoo!",
    "Amazing! Go tell your AlgeBros!",
    "You must be a matheMAGICian.",
    "Can you make 10?? YES YOU CAN!",
    "Woot woot!"
  ]
  
  static private let unsuccessfulResponses = [
    "Errrrrr, no.",
    "Do you math?",
    "Yeah, no.",
    "Sorry, no.",
    "Definitely not.",
    "Lol.",
    "Are you even trying?",
    "Really?"
  ]

  static func provideCustomFeedback(for result: Double) -> String {
    var index: Int
    var response: String
    
    if result == 10 {
      index = Int.random(in: 0..<successfulResponses.count)
      response = successfulResponses[index]
    } else {
      index = Int.random(in: 0..<unsuccessfulResponses.count)
      response = unsuccessfulResponses[index]
    }
    
    return response
  }
}
