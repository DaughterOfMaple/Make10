//
//  DoubleExtensions.swift
//  TestingCVAgain
//
//  Created by Carly Mapleson on 30/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import Foundation

extension Double {
    func round(to places:Int) -> Double {
      let divisor = Double(10 ^ places)
      let roundedValue = (self * divisor).rounded() / divisor
      return roundedValue
    }
}
