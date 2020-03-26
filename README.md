# AnimationByTransformation
Transformation View By animation

<img src="https://media.giphy.com/media/MFImzBNMa5DWUjSse2/giphy.gif" width="150" height="300" />
👉 First What We Want ⁉️ 

1️⃣ SETUP UI
- Add BottomView and implement in it UIView (↑) && Button with image
- Add stack for button which appear after show view

2️⃣ Programmatically - Transform Bottom View 
- set alpha for buttons in stack = Zero 
  to can control transparent for this buttons
  
- Action for toggelButton 
  to play with transform 🤔
  a. transform UIView to make it as a scale for bottom view 
  b. transform for. UIButton - rotation 180 Degree
  c. bottomView Transform by negative to show it in the screen 
  d. in completion for animation You can set Alpha for stack buttons to show it 😁
  
  > in this stage you should have question we finished !!? 🤔
    the answer "No" Because now we can open bottom view put we can't close it
    
    How can i close it 🤔⁉️ 
- in transform When the value of this property is anything other than the identity transform, the value in the frame    property is undefined and should be ignored. So to reset everything you should transform views to be identity that will reset  your 
  

3️⃣ What for TextField Change width by animating that is very easy in this way what i did; <br />
    i just set constant constraint for textField above this textfield i set button which hidden after you clicked; <br />
    in this stage you should change width constraint to make it inncrease ; <br />
   Who Animate it !? <br />
    UIView.animate(withDuration: 0.5, animations: { <br />
         self.view.layoutIfNeeded().  // this method to force the view to update its layout immediately. <br />
    }) { (done) in <br />
         self.searchTF.resignFirstResponder() // to relinquish first responder status <br />
    } <br />

