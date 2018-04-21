//
//  File.swift
//  Chem Formula
//
//  Created by ZBZ on 22/12/15.
//  Copyright © 2015 ___ZHANG_BOZHENG___. All rights reserved.
//

import Foundation

class File {
    
    func read(){
        
        let file = "zbz_lvlvchemformula8.txt" //this is the file. we will write to and read from it
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
            
            if(NSFileManager.defaultManager().fileExistsAtPath(path)){
                //reading
                do {
                    let text = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                    let splitText = text.componentsSeparatedByString(" ");
                    
                    if(splitText.count > 0){
                        if(splitText[0] != ""){
                            Settings.highScoreNoMistakes = Int(splitText[0])!;
                        }
                    }
                    if(splitText.count > 1){
                        if(splitText[1] != ""){
                            Settings.highScoreTimed = Double(splitText[1])!;
                        }
                    }
                    if(splitText.count > 2){
                        if(splitText[2] != ""){
                            Settings.qnCompleted = Int(splitText[2])!;
                        }
                    }
                    if(splitText.count > 3){
                        if(splitText[3] != ""){
                            Settings.timerTimedPrac = Int(splitText[3])!;
                        }
                    }
                    if(splitText.count > 4){
                        if(splitText[4] != ""){
                            Settings.qnNo2Play = Int(splitText[4])!;
                        }
                    }
                    if(splitText.count > 5){
                        if(splitText[5] != ""){
                            Settings.showIonCharge = Int(splitText[5])!;
                        }
                    }
                    if(splitText.count > 6){
                        if(splitText[6] != ""){
                            
                        }
                    }
                    if(splitText.count > 7){
                        if(splitText[7] != ""){
                            Settings.music = Int(splitText[7])!;
                        }
                    }
                    
                }
                catch {/* error handling here */}
            }
                
            else{
                
                //writing
                
                var text = "";
                
                do {
                    
                    text += String(Settings.highScoreNoMistakes) + " "
                    text += String(Settings.highScoreTimed) + " "
                    text += String(Settings.qnCompleted) + " "
                    text += String(Settings.timerTimedPrac) + " "
                    text += String(Settings.qnNo2Play) + " "
                    text += String(Settings.showIonCharge) + " "
                    text += String(Settings.difficulty) + " "
                    text += String(Settings.music) + " "
                    
                    try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
                }
                catch {/* error handling here */}
                
            }
            
        }
        
    }
    
    func write(){
        
        let file = "zbz_lvlvchemformula8.txt" //this is the file. we will write to and read from it
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
                
            //writing
            
            var text = "";
            
            do {
                
                text += String(Settings.highScoreNoMistakes) + " "
                text += String(Settings.highScoreTimed) + " "
                text += String(Settings.qnCompleted) + " "
                text += String(Settings.timerTimedPrac) + " "
                text += String(Settings.qnNo2Play) + " "
                text += String(Settings.showIonCharge) + " "
                text += String(Settings.difficulty) + " "
                text += String(Settings.music) + " "
                
                try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
            
        }
        
    }
    
}
