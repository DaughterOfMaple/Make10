//
//  MakeTenGestures.swift
//  MakeTenSimple
//
//  Created by Carly Mapleson on 4/6/20.
//  Copyright © 2020 CoobCorp. All rights reserved.
//

import UIKit

extension MakeTenViewController: UIGestureRecognizerDelegate {
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
}
