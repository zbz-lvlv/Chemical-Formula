//
//  BackgroundMusic.swift
//  Chem Formula
//
//  Created by Zhang Bozheng on 21/8/16.
//  Copyright © 2016 ___ZHANG_BOZHENG___. All rights reserved.
//

import Foundation
import AVFoundation

class BackgroundMusic {
    
    static var player: AVAudioPlayer?
    
    static func playBackgroundMusic(){
        
        //background music
        let url = NSBundle.mainBundle().URLForResource("background", withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
            player?.numberOfLoops = -1;
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
        
    }
    
    static func stopBackgroundMusic(){
        
        player!.stop();
        
    }
    
}