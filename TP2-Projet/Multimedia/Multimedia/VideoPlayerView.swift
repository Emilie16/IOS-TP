//
//  VideoPlayerView.swift
//  Multimedia
//
//  Created by user on 11.12.15.
//  Copyright © 2015 user. All rights reserved.
//

import UIKit
import MediaPlayer

class VideoPlayerView: UIViewController {
    
    //Movie Player variables
    var moviePlayer : MPMoviePlayerController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("Big_Buck_Bunny_Trailer", ofType:"m4v")
        let url = NSURL.fileURLWithPath(path!)
        
        self.moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = self.moviePlayer {
            player.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            player.view.sizeToFit()
            player.scalingMode = MPMovieScalingMode.AspectFit
            player.fullscreen = false
            player.controlStyle = MPMovieControlStyle.Embedded
            player.movieSourceType = MPMovieSourceType.File
            player.repeatMode = MPMovieRepeatMode.One
            player.play()
            self.view.addSubview(player.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
