//
//  SnowViewController.swift
//  Snow Fall
//
//  Created by Brian Bailey on 3/24/15.
//  Copyright (c) 2015 Brian Bailey. All rights reserved.
//

import UIKit

class SnowViewController: UIViewController {

    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!
    
    var blueSnow : UIView!
    var redSnow : UIView!
    var x : UInt32! = 0
    var y : UInt32! = 0

    override func viewDidLoad() { // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view) // The UIDynamicAnimator is instantiated with a reference view, which is usually the root view of the UIViewController, i.e., self.view.

        gravity = UIGravityBehavior() // adding behavior
        collision = UICollisionBehavior()
        animator.addBehavior(gravity)
        animator.addBehavior(collision)

        
        collision.addBoundaryWithIdentifier("ground", fromPoint: CGPointMake(0.0, self.view.frame.height), toPoint: CGPointMake(self.view.frame.width, self.view.frame.height))
        
        collision.translatesReferenceBoundsIntoBoundary = true // You can set the bounds of the view to automatically be boundaries by setting the translatesReferenceBoundsIntoBoundaries property.

        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "onTimer", userInfo: nil, repeats: true)
//        println("\(self.view.frame.width)")
    }

    override func didReceiveMemoryWarning() { // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
        
    }
    
    func onTimer() { // code to be run periodically
        println("create blue snowflake")
        x = arc4random_uniform(700) // To generate a random number between 0 and device width
        y = arc4random_uniform(0)
        
        blueSnow = UIView(frame: CGRectMake(CGFloat(x), CGFloat(y), 10, 10))
        blueSnow.backgroundColor = UIColor.blueColor()
        
        view.addSubview(blueSnow)
        gravity.addItem(blueSnow) // add physics to items
        collision.addItem(blueSnow)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
