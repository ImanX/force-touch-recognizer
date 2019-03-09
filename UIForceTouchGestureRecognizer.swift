//
//  ForceTouchRecognition.swift
//  Gryscope
//
//  Created by ImanX on 3/8/19.
//  Copyright © 2019 ImanX. All rights reserved.
//

import Foundation
import UIKit.UIGestureRecognizerSubclass
class UIForceTouchGestureRecognizer : UIGestureRecognizer{
   
    private var force: CGFloat = 3.5;
    public var isEnableNotifyFeedback: Bool = false;
    public var forceDelegate: UIForceTouchRecognizerDelegate?;

    public init(target: Any?, action: Selector? , force:CGFloat){
        super.init(target: target, action:action);
        self.force = force;
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            checkTouch(touch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            checkTouch(touch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        state = UIGestureRecognizer.State.failed
        notify(feedback: .error);
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        state = UIGestureRecognizer.State.failed
        notify(feedback: .error);
    }
    
    
    private func checkTouch(_ touch: UITouch) {
    
        guard touch.force != 0 else {
            return
            
        }
        
        if let safeDelegate = forceDelegate{
            safeDelegate.didRecognizer(force: touch.force);
        }
        
        if touch.force >= force {
            state = UIGestureRecognizer.State.recognized
            notify(feedback: .success);
        }
    }
    
    private func notify(feedback:UINotificationFeedbackGenerator.FeedbackType){
        if isEnableNotifyFeedback {
            UINotificationFeedbackGenerator().notificationOccurred(feedback);
        }
    }

}
