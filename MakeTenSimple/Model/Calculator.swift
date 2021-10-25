//
//  Calculator.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 24/5/20.
//  Copyright © 2020 Carly Mapleson. All rights reserved.
//


import Foundation
import MathParser

struct Calculator {
  static fileprivate var errorByMathParser: String?
  static fileprivate var result: Double?
  
  static func evaluate (_ input: [String]) throws -> (Double?) {
    do {
      try checkInputs(for: input)
    } catch let error as InputError {
      throw error
    }
    
    do {
      let inputString = input.asString()
      result = try inputString.evaluate()
      print("value from DDMathParser is: \(String(describing: result))")
    } catch let error as MathParserError {
      throw error
    }
    
    return result
  }
}

fileprivate func checkInputs(for array: [String]) throws {
  for index in 0...(array.count - 2) {
    switch array[index] {
      
    case "?": // more robust code in case of bugs with initial input
      throw InputError.numberInputMissing
      //        errorByInputCheck = "Seriously? No. Try again."
      
    case "0"..."9":  // DDMathParser adds implicit multiplication between numbers
      if array[index + 1].isDigit() {
        throw InputError.operatorMissingBetweenNumbers
        //          errorByInputCheck = "No, no, you can't just join numbers like that."
      }
      
    case "!":  // DDMathParser allows double factorial
      if array[index + 1] == "!" {
        throw InputError.doubleFactorial
        //          errorByInputCheck = "Let's not get greedy now... one factorial is enough 😑"
      }
      
    default:
      return
    }
  }
}

