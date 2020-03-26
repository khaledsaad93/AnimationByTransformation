# AnimationByTransformation
Transformation View By animation

<img src="https://media.giphy.com/media/MFImzBNMa5DWUjSse2/giphy.gif" width="150" height="300" />

## Animate Bottom View by Transform

1️⃣ SETUP UI
- Add BottomView and implement in it UIView (↑) && Button with image
- Add stack for button which appear after show view

2️⃣ Programmatically - Transform Bottom View 
- set alpha for buttons in stack = Zero 
  to can control transparent for this buttons
  
- Action for toggelButton 
  to play with transform 🤔
  1. transform UIView to make it as a scale for bottom view 
  2. transform for. UIButton - rotation 180 Degree
  3. bottomView Transform by negative to show it in the screen
  4. in completion for animation You can set Alpha for stack buttons to show it 😁
  
######      in this stage you should have question we finished !!? 🤔
  - the answer "No" Because now we can open bottom view put we can't close it and How can i close it 🤔⁉️
  a. in transform When the value of this property is anything other than the identity transform, the value in the frame
  property is undefined and should be ignored. So to reset everything you should transform views to be identity that will
  reset  your 
  

## Animate TextField
- Change width by animating that is very easy in this way what i did
- i just set constant constraint for textField above this textfield i set button which hidden after you clicked
- in this stage you should change width constraint to make it increase
######    how Animate it !? 
    UIView.animate(withDuration: 0.5, animations: {
         self.view.layoutIfNeeded().  // this method to force the view to update its layout immediately.
    }) { (done) in
         self.searchTF.resignFirstResponder() // to relinquish first responder status
    }

## TODO
BottomSheetView

