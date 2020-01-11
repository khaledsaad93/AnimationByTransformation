//
//  NextViewController.swift
//  Animation-BottomMenu
//
//  Created by khaled saad on 1/3/20.
//  Copyright © 2020 khaled saad. All rights reserved.
//

import UIKit

enum CardState {
    case expanded
    case collapsed
}

class NextViewController: UIViewController {

    var bottomCardViewController: CardViewController!
    var visualEffectView: UIVisualEffectView!
    
    let cardHight:CGFloat = 600
    let cardHandleAreaHight:CGFloat = 65
    
    var cardVisible = false
    var nextState: CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var runingAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCard()
    }
   
    func setupCard() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        
        bottomCardViewController = CardViewController(nibName: "BottomCardView", bundle: nil)
        self.addChild(bottomCardViewController)
        self.view.addSubview(bottomCardViewController.view)
        
        bottomCardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHight, width: self.view.bounds.width, height: cardHight)
        bottomCardViewController.view.clipsToBounds = true
    }
    
}
