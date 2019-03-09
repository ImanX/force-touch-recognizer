# force-touch-recognizer
Simple classes for handle of 3D Touch &amp; Force Touch on Swift.

Simply handle force touch on your swift project bassed `UIGestureRecognizer`

```swift
  override func viewDidLoad() {
        super.viewDidLoad()
        let forceGesture = UIForceTouchGestureRecognizer(target: self, action: #selector(didForce),force: 6.0)
        forceGesture.forceDelegate = self; //if you implemented protocol.
        forceGesture.isEnableNotifyFeedback = true; //if you will feedback.
        view.addGestureRecognizer(forceGesture)
   }


   //this method of UIForceTouchRecognizerDelegate and optional.
   func didRecognizer(force: CGFloat) {
        print(force)
   }
   
   
   //When touch forced invoke this .
    @objc func didForce() {
        let alert = UIAlertController(title: "3D Touch", message: "3D touch worked succesfully", preferredStyle: .actionSheet);
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil);
    }
   
    

```
