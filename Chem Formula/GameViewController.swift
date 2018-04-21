//
//  GameViewController.swift
//  Chem Formula
//
//  Created by ZBZ on 17/12/15.
//  Copyright (c) 2015 ___ZHANG_BOZHENG___. All rights reserved.
//

import UIKit
import SpriteKit
import SystemConfiguration
import AVFoundation

class GameViewController: UIViewController{
    
    var player: AVAudioPlayer?
    let fileObj = File();
    let bgMusic = BackgroundMusic();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileObj.read()
        
        if(Settings.music == 1){
            BackgroundMusic.playBackgroundMusic()
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view
            let skView = self.view as! SKView
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .ResizeFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
