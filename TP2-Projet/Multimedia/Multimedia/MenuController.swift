//
//  MenuController.swift
//  Multimedia
//
//  Created by user on 15.12.15.
//  Copyright © 2015 user. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //------------right swipe gestures in view--------------//
        let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector("rightSwiped"))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        //-----------left swipe gestures in view--------------//
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector("leftSwiped"))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playMusic(sender: AnyObject) {
        performSegueWithIdentifier("showMusicList", sender: self)
    }
    
    @IBAction func playVideo(sender: AnyObject) {
        performSegueWithIdentifier("showVideoLauncher", sender: self)
    }
    
    func rightSwiped() {
        print("right swiped ")
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("playMusic") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)*/
        performSegueWithIdentifier("showMusicList", sender: self)
    }

    func leftSwiped() {
        print("left swiped ")
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("playMovie") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)*/
        performSegueWithIdentifier("showVideoLauncher", sender: self)
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
