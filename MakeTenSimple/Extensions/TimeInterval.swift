//
//  TimeIntervalExtensions.swift
//  TestingCVAgain
//
//  Created by Carly Mapleson on 27/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import Foundation

extension TimeInterval {
  func stringFromTimeInterval() -> String {
    let time = NSInteger(self)
    
    let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 10)
    let seconds = time % 60
    let minutes = (time / 60) % 60
    let hours = (time / 3600)
    
    return String(format: "%0dh %0dm %0d.%0ds", hours, minutes, seconds, ms)
  }
}
