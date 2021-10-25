//
//  TimeManager.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 30/5/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//

import UIKit

class TimeManager {
  var timer = Timer()
  var timerIsRunning = false
  var gameDuration = 0.0
  var label: UILabel
  
  init(with timerLabel: UILabel) {
    label = timerLabel
  }
  
  func startTimer() {
    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
  }
  
  @objc func updateTimer() {
    gameDuration += 0.1
    label.text = gameDuration.stringFromTimeInterval()
  }
  
  func stopTimer() {
    timer.invalidate()
  }
}
