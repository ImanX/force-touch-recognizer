//
//  UIForceTouchRecognizerDelegate.swift
//  Gryscope
//
//  Created by ImanX on 3/9/19.
//  Copyright © 2019 ImanX. All rights reserved.
//

import Foundation
import UIKit.UIGestureRecognizerSubclass

protocol UIForceTouchRecognizerDelegate {
    func didRecognizer(force:CGFloat)
}
