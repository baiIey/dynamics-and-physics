//
//  SnowViewController.swift
//  Snow Fall
//
//  Created by Brian Bailey on 3/24/15.
//  Copyright (c) 2015 Brian Bailey. All rights reserved.
//

import UIKit

class SnowViewController: UIViewController, UICollisionBehaviorDelegate {

    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!
    
    var blueSnow : UIView!
    var redSnow : UIView!
    var blackSnow : UIView!
    var frameWidth : UInt32! = 0
    var frameHeight : UInt32! = 0
    var x : UInt32! = 0
    var y : UInt32! = 0

    override func viewDidLoad() { // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view) // The UIDynamicAnimator is instantiated with a reference view, which is usually the root view of the UIViewController, i.e., self.view.

        gravity = UIGravityBehavior() // adding behavior
        collision = UICollisionBehavior()
        collision.collisionDelegate = self
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        collision.addBoundaryWithIdentifier("ground", fromPoint: CGPointMake(0.0, self.view.frame.height), toPoint: CGPointMake(self.view.frame.width, self.view.frame.height))
//        collision.translatesReferenceBoundsIntoBoundary = true // You can set the bounds of the view to automatically be boundaries by setting the translatesReferenceBoundsIntoBoundaries property.


        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "blueTimer", userInfo: nil, repeats: true)
//        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "redTimer", userInfo: nil, repeats: true)
//        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "blackTimer", userInfo: nil, repeats: true)
        
        frameWidth = UInt32(self.view.frame.width) // converts float to integer
        frameHeight = UInt32(self.view.frame.height)
        println("Frame width: \(frameWidth)")
    }
    
    override func didReceiveMemoryWarning() { // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
        
    }
    
    func blueTimer() { // code to be run periodically
        println("+blue block")
        x = arc4random_uniform(frameWidth) // To generate a random number between 0 and device width
        y = arc4random_uniform(0)
        
        blueSnow = UIView(frame: CGRectMake(CGFloat(x), CGFloat(y), 10, 10))
        blueSnow.backgroundColor = UIColor.blueColor()
        
        view.addSubview(blueSnow)
        
        gravity.addItem(blueSnow) // add physics to items
        collision.addItem(blueSnow)
        
        blueSnow.alpha = 0
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.blueSnow.alpha = 1 // fade-in block
        })

    }
    
    func redTimer() { // code to be run periodically
        println("+red block")
        x = arc4random_uniform(frameWidth) // To generate a random number between 0 and device width
        y = arc4random_uniform(0)
        
        redSnow = UIView(frame: CGRectMake(CGFloat(x), CGFloat(y), 10, 10))
        redSnow.backgroundColor = UIColor.redColor()
        
        view.addSubview(redSnow)
        gravity.addItem(redSnow) // add physics to items
        collision.addItem(redSnow)
        
        redSnow.alpha = 0
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.redSnow.alpha = 1 // fade-in block
        })
    }
    
    func blackTimer() { // code to be run periodically
        println("+black block")
        x = arc4random_uniform(frameWidth) // To generate a random number between 0 and device width
        y = arc4random_uniform(0)
        
        blackSnow = UIView(frame: CGRectMake(CGFloat(x), CGFloat(y), 50, 50))
        blackSnow.backgroundColor = UIColor.blackColor()
        
        view.addSubview(blackSnow)
        gravity.addItem(blackSnow) // add physics to items
        collision.addItem(blackSnow)
        
        blackSnow.alpha = 0
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.blackSnow.alpha = 1 // fade-in block
        })
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        var boundary = identifier as String // You have to convert the identifier to a string
        var view = item as UIView // The view that collided with the boundary has to be converted to a view
        
        if boundary == "ground" {
            // Detected collision with a boundary called "ground"
            println("hit ground")
        } else if (boundary == "") {
            // Detected collision with bounds of reference view
            println("hit something")
        }
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
