//
//  ErrorHandling.swift
//  TestingCVAgain
//
//  Created by Carly Mapleson on 27/5/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import Foundation
import MathParser

struct ErrorManager {
  static func customOutput(for error: Error) -> String {
    
    if let inputError = error as? InputError {
      switch inputError {
      case .numberInputMissing:
        return "Try adding some numbers 😉"
      case .operatorMissingBetweenNumbers:
        return "You can't do that! Please put some operations in."
      case .doubleFactorial:
        return "Double factorials?? Let's not get TOO excited here 🤓"
      }
    }
      
    else if let mathError = error as? MathParserError {
      switch mathError.kind {
      // Tokenization Errors
      case .cannotParseNumber,
           .cannotParseHexNumber,
           .cannotParseOctalNumber,
           .cannotParseFractionalNumber,
           .cannotParseExponent,
           .cannotParseIdentifier,
           .cannotParseVariable,
           .cannotParseQuotedVariable,
           .cannotParseOperator,
           .zeroLengthVariable:
        return "Oh no! Something funny happened on our end. Please report a bug, if this continues to happen 😵"
        
      // Resolution Errors
      case .cannotParseLocalizedNumber,
           .unknownOperator,
           .ambiguousOperator:
        return "Hmmmmmm no. Try again."
        
      // Grouping Errors
      case .missingOpenParenthesis,
           .missingCloseParenthesis,
           .emptyFunctionArgument,
           .emptyGroup:
        return "Fix your brackets, please!"
        
      // Expression Errors
      case .invalidFormat,
           .missingLeftOperand,
           .missingRightOperand:
        return "What's going with those operators? Are you missing a number somewhere?"
        
      // Evaluation Errors
      case .unknownFunction,
           .unknownVariable,
           .invalidArguments:
        return "Something is not right."
      
      case .divideByZero:
        return "Are you dividing by 0?? Not cool, AlgeBro."
      }
    }
    
    return "Weird. Please try again."
  }
}
