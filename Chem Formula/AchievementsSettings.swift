//
//  AchievementsSettings.swift
//  Chem Formula
//
//  Created by ZBZ on 21/12/15.
//  Copyright © 2015 ___ZHANG_BOZHENG___. All rights reserved.
//

import Foundation
import SpriteKit

class AchievementsSettings: SKScene {
    
    var title = SKSpriteNode();
    var titleLabel = SKLabelNode();
    
    var highScoreNM = SKSpriteNode();
    var highScoreNMText = SKLabelNode()
    var highScoreNMLabel = SKLabelNode();
    
    var highScoreT = SKSpriteNode();
    var highScoreTText = SKLabelNode()
    var highScoreTLabel = SKLabelNode();
    
    var totalQnCompleted = SKSpriteNode();
    var totalQnCompletedText = SKLabelNode();
    var totalQnCompletedLabel = SKLabelNode();
    
    var soundInfo = SKSpriteNode();
    var soundInfoLabel = SKLabelNode();
    var sound = SKSpriteNode();
    var soundLabel = SKLabelNode();
    
    var showChargeInfo = SKSpriteNode();
    var showChargeInfoLabel = SKLabelNode();
    var showCharge = SKSpriteNode();
    var showChargeLabel = SKLabelNode();
    
    var timedPracTimer = SKSpriteNode();
    var timedPracTimerLabel = SKLabelNode();
    var timedPracTimerH = SKSpriteNode();
    var timedPracTimerHLabel = SKLabelNode();
    var timedPracTimerT = SKSpriteNode();
    var timedPracTimerTLabel = SKLabelNode();
    var timedPracTimerO = SKSpriteNode();
    var timedPracTimerOLabel = SKLabelNode();
    
    var twoPlayersQnNo = SKSpriteNode();
    var twoPlayersQnNoLabel = SKLabelNode();
    var twoPlayersQnNoH = SKSpriteNode();
    var twoPlayersQnNoHLabel = SKLabelNode();
    var twoPlayersQnNoT = SKSpriteNode();
    var twoPlayersQnNoTLabel = SKLabelNode();
    var twoPlayersQnNoO = SKSpriteNode();
    var twoPlayersQnNoOLabel = SKLabelNode();
    
    var difficulty = SKSpriteNode();
    var difficultyLabel = SKLabelNode();
    var pointer = SKSpriteNode(imageNamed: "arrow");
    var easy = SKSpriteNode();
    var easyLabel = SKLabelNode();
    var normal = SKSpriteNode();
    var normalLabel = SKLabelNode();
    var normalPointer = SKSpriteNode();
    var hard = SKSpriteNode();
    var hardLabel = SKLabelNode();
    var hardPointer = SKSpriteNode();
    
    var musicInfo = SKSpriteNode();
    var musicInfoLabel = SKLabelNode();
    var music = SKSpriteNode();
    var musicLabel = SKLabelNode();
    
    var back = SKSpriteNode();
    var backLabel = SKLabelNode();
    
    let fileObj = File();
    let bgMusic = BackgroundMusic();
    
    var screenHeight: CGFloat = 0.0;
    let noOfRows: CGFloat = 11;
    
    override func didMoveToView(view: SKView) {
        
        screenHeight = self.view!.frame.size.height;
        
        self.backgroundColor = UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1)
        
        fileObj.read()
        
        highScoreNMText.text = "Highscore (No Mistakes)"
        highScoreNMText.fontSize = 12;
        highScoreNMText.fontName = "Chalkboard SE"
        highScoreNMText.fontColor = self.backgroundColor;
        highScoreNMText.horizontalAlignmentMode = .Center
        highScoreNMText.verticalAlignmentMode = .Center
        highScoreNMText.position = CGPointMake(highScoreNMText.position.x, highScoreNMText.position.y - 10)
        
        highScoreNM.addChild(highScoreNMText)
        
        highScoreNMLabel.text = String(Settings.highScoreNoMistakes);
        highScoreNMLabel.fontSize = 20;
        highScoreNMLabel.fontName = "Chalkboard SE"
        highScoreNMLabel.fontColor = self.backgroundColor;
        highScoreNMLabel.horizontalAlignmentMode = .Center
        highScoreNMLabel.verticalAlignmentMode = .Center
        highScoreNMLabel.position = CGPointMake(highScoreNMLabel.position.x, highScoreNMLabel.position.y + 10)
        
        highScoreNM.addChild(highScoreNMLabel)
        
        highScoreNM.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / noOfRows - 1)
        highScoreNM.position = CGPointMake(self.view!.frame.size.width / 4, 21 * screenHeight / noOfRows / 2)
        highScoreNM.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(highScoreNM)
        
        highScoreTText.text = "Highscore (Timed)"
        highScoreTText.fontSize = 12;
        highScoreTText.fontName = "Chalkboard SE"
        highScoreTText.fontColor = self.backgroundColor;
        highScoreTText.horizontalAlignmentMode = .Center
        highScoreTText.verticalAlignmentMode = .Center
        highScoreTText.position = CGPointMake(highScoreTText.position.x, highScoreTText.position.y - 10)
        
        highScoreT.addChild(highScoreTText)
        
        highScoreTLabel.text = String(format: "%.3f", Settings.highScoreTimed) + "/s";
        highScoreTLabel.fontSize = 20;
        highScoreTLabel.fontName = "Chalkboard SE"
        highScoreTLabel.fontColor = self.backgroundColor;
        highScoreTLabel.horizontalAlignmentMode = .Center
        highScoreTLabel.verticalAlignmentMode = .Center
        highScoreTLabel.position = CGPointMake(highScoreTLabel.position.x, highScoreTLabel.position.y + 10)
        
        highScoreT.addChild(highScoreTLabel)
        
        highScoreT.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / noOfRows - 1)
        highScoreT.position = CGPointMake(3 * self.view!.frame.size.width / 4, 21 * screenHeight / noOfRows / 2)
        highScoreT.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(highScoreT)
        
        totalQnCompletedText.text = "Total formulas formed (1P)"
        totalQnCompletedText.fontSize = 12;
        totalQnCompletedText.fontName = "Chalkboard SE"
        totalQnCompletedText.fontColor = self.backgroundColor;
        totalQnCompletedText.horizontalAlignmentMode = .Center
        totalQnCompletedText.verticalAlignmentMode = .Center
        totalQnCompletedText.position = CGPointMake(totalQnCompletedText.position.x, totalQnCompletedText.position.y - 10)
        
        totalQnCompleted.addChild(totalQnCompletedText)
        
        totalQnCompletedLabel.text = String(Settings.qnCompleted);
        totalQnCompletedLabel.fontSize = 20;
        totalQnCompletedLabel.fontName = "Chalkboard SE"
        totalQnCompletedLabel.fontColor = self.backgroundColor;
        totalQnCompletedLabel.horizontalAlignmentMode = .Center
        totalQnCompletedLabel.verticalAlignmentMode = .Center
        totalQnCompletedLabel.position = CGPointMake(totalQnCompletedLabel.position.x, totalQnCompletedLabel.position.y + 10)
        
        totalQnCompleted.addChild(totalQnCompletedLabel)
        
        totalQnCompleted.size = CGSizeMake(self.view!.frame.size.width - 1, screenHeight / noOfRows - 1)
        totalQnCompleted.position = CGPointMake(self.view!.frame.size.width / 2, 19 * screenHeight / noOfRows / 2)
        totalQnCompleted.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(totalQnCompleted)
        
        soundInfoLabel.text = "Background Music"
        soundInfoLabel.fontSize = 20;
        soundInfoLabel.fontName = "Chalkboard SE"
        soundInfoLabel.fontColor = self.backgroundColor;
        soundInfoLabel.horizontalAlignmentMode = .Center
        soundInfoLabel.verticalAlignmentMode = .Center
        
        soundInfo.addChild(soundInfoLabel);
        
        soundInfo.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / noOfRows - 1)
        soundInfo.position = CGPointMake(self.view!.frame.size.width / 4 , 17 * screenHeight / noOfRows / 2)
        soundInfo.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(soundInfo)
        
        if(Settings.music == 0){
            soundLabel.text = "No"
        }
        else{
            soundLabel.text = "Yes"
        }
        soundLabel.fontSize = 20;
        soundLabel.fontName = "Chalkboard SE"
        soundLabel.fontColor = self.backgroundColor;
        soundLabel.horizontalAlignmentMode = .Center
        soundLabel.verticalAlignmentMode = .Center
        
        sound.addChild(soundLabel)
        
        sound.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / noOfRows - 1)
        sound.position = CGPointMake(3 * self.view!.frame.size.width / 4 , 17 * screenHeight / noOfRows / 2)
        sound.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(sound)
        
        showChargeInfoLabel.text = "Show Ion Charge"
        showChargeInfoLabel.fontSize = 20;
        showChargeInfoLabel.fontName = "Chalkboard SE"
        showChargeInfoLabel.fontColor = self.backgroundColor;
        showChargeInfoLabel.horizontalAlignmentMode = .Center
        showChargeInfoLabel.verticalAlignmentMode = .Center
        
        showChargeInfo.addChild(showChargeInfoLabel);
        
        showChargeInfo.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / noOfRows - 1)
        showChargeInfo.position = CGPointMake(self.view!.frame.size.width / 4 , 15 * screenHeight / noOfRows / 2)
        showChargeInfo.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(showChargeInfo)
        
        if(Settings.showIonCharge == 0){
            showChargeLabel.text = "No"
        }
        else{
            showChargeLabel.text = "Yes"
        }
        showChargeLabel.fontSize = 20;
        showChargeLabel.fontName = "Chalkboard SE"
        showChargeLabel.fontColor = self.backgroundColor;
        showChargeLabel.horizontalAlignmentMode = .Center
        showChargeLabel.verticalAlignmentMode = .Center
        
        showCharge.addChild(showChargeLabel)
        
        showCharge.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / noOfRows - 1)
        showCharge.position = CGPointMake(3 * self.view!.frame.size.width / 4 , 15 * screenHeight / noOfRows / 2)
        showCharge.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(showCharge)
        
        timedPracTimerLabel.text = "Timed Practice Timer (Seconds)"
        timedPracTimerLabel.fontSize = 20;
        timedPracTimerLabel.fontName = "Chalkboard SE"
        timedPracTimerLabel.fontColor = self.backgroundColor;
        timedPracTimerLabel.horizontalAlignmentMode = .Center
        timedPracTimerLabel.verticalAlignmentMode = .Center
        
        timedPracTimer.addChild(timedPracTimerLabel);
        
        timedPracTimer.size = CGSizeMake(self.view!.frame.size.width - 1, screenHeight / noOfRows - 1)
        timedPracTimer.position = CGPointMake(self.view!.frame.size.width / 2 , 13 * screenHeight / noOfRows / 2)
        timedPracTimer.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(timedPracTimer)
        
        timedPracTimerHLabel.text = String(Settings.timerTimedPrac / 100)
        timedPracTimerHLabel.fontSize = 20;
        timedPracTimerHLabel.fontName = "Chalkboard SE"
        timedPracTimerHLabel.fontColor = self.backgroundColor;
        timedPracTimerHLabel.horizontalAlignmentMode = .Center
        timedPracTimerHLabel.verticalAlignmentMode = .Center
        
        timedPracTimerH.addChild(timedPracTimerHLabel)
        
        timedPracTimerH.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        timedPracTimerH.position = CGPointMake(self.view!.frame.size.width / 6 , 11 * screenHeight / noOfRows / 2)
        timedPracTimerH.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(timedPracTimerH)
        
        timedPracTimerTLabel.text = String((Settings.timerTimedPrac - Int(Settings.timerTimedPrac / 100) * 100) / 10)
        timedPracTimerTLabel.fontSize = 20;
        timedPracTimerTLabel.fontName = "Chalkboard SE"
        timedPracTimerTLabel.fontColor = self.backgroundColor;
        timedPracTimerTLabel.horizontalAlignmentMode = .Center
        timedPracTimerTLabel.verticalAlignmentMode = .Center
        
        timedPracTimerT.addChild(timedPracTimerTLabel)
        
        timedPracTimerT.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        timedPracTimerT.position = CGPointMake(3 * self.view!.frame.size.width / 6 , 11 * screenHeight / noOfRows / 2)
        timedPracTimerT.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(timedPracTimerT)
        
        timedPracTimerOLabel.text = String(Settings.timerTimedPrac - Int(timedPracTimerHLabel.text!)! * 100 - Int(timedPracTimerTLabel.text!)! * 10)
        timedPracTimerOLabel.fontSize = 20;
        timedPracTimerOLabel.fontName = "Chalkboard SE"
        timedPracTimerOLabel.fontColor = self.backgroundColor;
        timedPracTimerOLabel.horizontalAlignmentMode = .Center
        timedPracTimerOLabel.verticalAlignmentMode = .Center
        
        timedPracTimerO.addChild(timedPracTimerOLabel)
        
        timedPracTimerO.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        timedPracTimerO.position = CGPointMake(5 * self.view!.frame.size.width / 6 , 11 * screenHeight / noOfRows / 2)
        timedPracTimerO.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(timedPracTimerO)
        
        twoPlayersQnNoLabel.text = "No. of Questions for 2 Players"
        twoPlayersQnNoLabel.fontSize = 20;
        twoPlayersQnNoLabel.fontName = "Chalkboard SE"
        twoPlayersQnNoLabel.fontColor = self.backgroundColor;
        twoPlayersQnNoLabel.horizontalAlignmentMode = .Center
        twoPlayersQnNoLabel.verticalAlignmentMode = .Center
        
        twoPlayersQnNo.addChild(twoPlayersQnNoLabel);
        
        twoPlayersQnNo.size = CGSizeMake(self.view!.frame.size.width - 1, screenHeight / noOfRows - 1)
        twoPlayersQnNo.position = CGPointMake(self.view!.frame.size.width / 2 , 9 * screenHeight / noOfRows / 2)
        twoPlayersQnNo.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(twoPlayersQnNo)
        
        twoPlayersQnNoHLabel.text = String(Settings.qnNo2Play / 100)
        twoPlayersQnNoHLabel.fontSize = 20;
        twoPlayersQnNoHLabel.fontName = "Chalkboard SE"
        twoPlayersQnNoHLabel.fontColor = self.backgroundColor;
        twoPlayersQnNoHLabel.horizontalAlignmentMode = .Center
        twoPlayersQnNoHLabel.verticalAlignmentMode = .Center
        
        twoPlayersQnNoH.addChild(twoPlayersQnNoHLabel)
        
        twoPlayersQnNoH.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        twoPlayersQnNoH.position = CGPointMake(self.view!.frame.size.width / 6 , 7 * screenHeight / noOfRows / 2)
        twoPlayersQnNoH.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(twoPlayersQnNoH)
        
        twoPlayersQnNoTLabel.text = String((Settings.qnNo2Play - Int(Settings.qnNo2Play / 100) * 100) / 10)
        twoPlayersQnNoTLabel.fontSize = 20;
        twoPlayersQnNoTLabel.fontName = "Chalkboard SE"
        twoPlayersQnNoTLabel.fontColor = self.backgroundColor;
        twoPlayersQnNoTLabel.horizontalAlignmentMode = .Center
        twoPlayersQnNoTLabel.verticalAlignmentMode = .Center
        
        twoPlayersQnNoT.addChild(twoPlayersQnNoTLabel)
        
        twoPlayersQnNoT.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        twoPlayersQnNoT.position = CGPointMake(3 * self.view!.frame.size.width / 6 , 7 * screenHeight / noOfRows / 2)
        twoPlayersQnNoT.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(twoPlayersQnNoT)
        
        twoPlayersQnNoOLabel.text = String(Settings.qnNo2Play - Int(twoPlayersQnNoHLabel.text!)! * 100 - Int(twoPlayersQnNoTLabel.text!)! * 10)
        twoPlayersQnNoOLabel.fontSize = 20;
        twoPlayersQnNoOLabel.fontName = "Chalkboard SE"
        twoPlayersQnNoOLabel.fontColor = self.backgroundColor;
        twoPlayersQnNoOLabel.horizontalAlignmentMode = .Center
        twoPlayersQnNoOLabel.verticalAlignmentMode = .Center
        
        twoPlayersQnNoO.addChild(twoPlayersQnNoOLabel)
        
        twoPlayersQnNoO.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        twoPlayersQnNoO.position = CGPointMake(5 * self.view!.frame.size.width / 6 , 7 * screenHeight / noOfRows / 2)
        twoPlayersQnNoO.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(twoPlayersQnNoO)
        
        difficultyLabel.text = "Difficulty of Ions"
        difficultyLabel.fontSize = 20;
        difficultyLabel.fontName = "Chalkboard SE"
        difficultyLabel.fontColor = self.backgroundColor;
        difficultyLabel.horizontalAlignmentMode = .Center
        difficultyLabel.verticalAlignmentMode = .Center
        
        difficulty.addChild(difficultyLabel);
        
        difficulty.size = CGSizeMake(self.view!.frame.size.width - 1, screenHeight / noOfRows - 1)
        difficulty.position = CGPointMake(self.view!.frame.size.width / 2 , 5 * screenHeight / noOfRows / 2)
        difficulty.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(difficulty)
        
        easyLabel.text = "Easy"
        easyLabel.fontSize = 20;
        easyLabel.fontName = "Chalkboard SE"
        easyLabel.fontColor = self.backgroundColor;
        easyLabel.horizontalAlignmentMode = .Center
        easyLabel.verticalAlignmentMode = .Center
        
        easy.addChild(easyLabel)
        
        easy.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        easy.position = CGPointMake(self.view!.frame.size.width / 6 , 3 * screenHeight / noOfRows / 2)
        easy.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(easy)
        
        normalLabel.text = "Normal"
        normalLabel.fontSize = 20;
        normalLabel.fontName = "Chalkboard SE"
        normalLabel.fontColor = self.backgroundColor;
        normalLabel.horizontalAlignmentMode = .Center
        normalLabel.verticalAlignmentMode = .Center
        
        normal.addChild(normalLabel)
        
        normal.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        normal.position = CGPointMake(3 * self.view!.frame.size.width / 6 , 3 * screenHeight / noOfRows / 2)
        normal.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(normal)
        
        hardLabel.text = "Hard"
        hardLabel.fontSize = 20;
        hardLabel.fontName = "Chalkboard SE"
        hardLabel.fontColor = self.backgroundColor;
        hardLabel.horizontalAlignmentMode = .Center
        hardLabel.verticalAlignmentMode = .Center
        
        hard.addChild(hardLabel)
        
        hard.size = CGSizeMake(self.view!.frame.size.width / 3 - 1, screenHeight / noOfRows - 1)
        hard.position = CGPointMake(5 * self.view!.frame.size.width / 6 , 3 * screenHeight / noOfRows / 2)
        hard.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(hard)
        
        pointer.size = CGSizeMake(16, 16)
        pointer.position = CGPointMake(CGFloat(1 + Settings.difficulty * 2) * self.view!.frame.size.width / 6 , 3 * screenHeight / noOfRows / 2 - 18)
        pointer.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(pointer);
        
        backLabel.text = "←"
        backLabel.fontSize = 30;
        backLabel.fontName = "Chalkboard SE"
        backLabel.fontColor = self.backgroundColor;
        backLabel.horizontalAlignmentMode = .Center
        backLabel.verticalAlignmentMode = .Center
        
        back.addChild(backLabel)
        
        back.size = CGSizeMake(self.view!.frame.size.width - 1, screenHeight / noOfRows - 1)
        back.position = CGPointMake(2 * self.view!.frame.size.width / 4, 1 * screenHeight / noOfRows / 2)
        back.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(back)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.locationInNode(self)
            
            if(nodeAtPoint(location) == sound || nodeAtPoint(location) == soundLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(Settings.music == 0){
                    Settings.music = 1;
                    BackgroundMusic.playBackgroundMusic();
                    soundLabel.text = "Yes"
                }
                else{
                    Settings.music = 0;
                    BackgroundMusic.stopBackgroundMusic();
                    soundLabel.text = "No"
                }
                
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == showCharge || nodeAtPoint(location) == showChargeLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(Settings.showIonCharge == 0){
                    Settings.showIonCharge = 1;
                    showChargeLabel.text = "Yes"
                }
                else{
                    Settings.showIonCharge = 0;
                    showChargeLabel.text = "No"
                }
                
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == timedPracTimerO || nodeAtPoint(location) == timedPracTimerOLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(timedPracTimerOLabel.text == "9"){
                    Settings.timerTimedPrac -= 9;
                }
                else{
                    Settings.timerTimedPrac += 1;
                }
                
                timedPracTimerOLabel.text = String(Settings.timerTimedPrac - Int(timedPracTimerHLabel.text!)! * 100 - Int(timedPracTimerTLabel.text!)! * 10)
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == timedPracTimerT || nodeAtPoint(location) == timedPracTimerTLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(timedPracTimerTLabel.text == "9"){
                    Settings.timerTimedPrac -= 90;
                }
                else{
                    Settings.timerTimedPrac += 10;
                }
                
                timedPracTimerTLabel.text = String((Settings.timerTimedPrac - Int(Settings.timerTimedPrac / 100) * 100) / 10)
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == timedPracTimerH || nodeAtPoint(location) == timedPracTimerHLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(timedPracTimerHLabel.text == "9"){
                    Settings.timerTimedPrac -= 900;
                }
                else{
                    Settings.timerTimedPrac += 100;
                }
                
                timedPracTimerHLabel.text = String(Settings.timerTimedPrac / 100)
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == twoPlayersQnNoO || nodeAtPoint(location) == twoPlayersQnNoOLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(twoPlayersQnNoOLabel.text == "9"){
                    Settings.qnNo2Play -= 9;
                }
                else{
                    Settings.qnNo2Play += 1;
                }
                
                twoPlayersQnNoOLabel.text = String(Settings.qnNo2Play - Int(twoPlayersQnNoHLabel.text!)! * 100 - Int(twoPlayersQnNoTLabel.text!)! * 10)
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == twoPlayersQnNoT || nodeAtPoint(location) == twoPlayersQnNoTLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(twoPlayersQnNoTLabel.text == "9"){
                    Settings.qnNo2Play -= 90;
                }
                else{
                    Settings.qnNo2Play += 10;
                }
                
                twoPlayersQnNoTLabel.text = String((Settings.qnNo2Play - Int(Settings.qnNo2Play / 100) * 100) / 10)
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == twoPlayersQnNoH || nodeAtPoint(location) == twoPlayersQnNoHLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(twoPlayersQnNoHLabel.text == "9"){
                    Settings.qnNo2Play -= 900;
                }
                else{
                    Settings.qnNo2Play += 100;
                }
                
                twoPlayersQnNoHLabel.text = String(Settings.qnNo2Play / 100)
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == easy || nodeAtPoint(location) == easyLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                pointer.position = CGPointMake(self.view!.frame.size.width / 6 , 3 * screenHeight / 20 - 18);
                Settings.difficulty = 0;
                
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == normal || nodeAtPoint(location) == normalLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                pointer.position = CGPointMake(3 * self.view!.frame.size.width / 6 , 3 * screenHeight / 20 - 18);
                Settings.difficulty = 1;
                
                fileObj.write()
                
            }
            
            if(nodeAtPoint(location) == hard || nodeAtPoint(location) == hardLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                pointer.position = CGPointMake(5 * self.view!.frame.size.width / 6 , 3 * screenHeight / 20 - 18);
                Settings.difficulty = 2;
                
                fileObj.write()
                
            }

            if(nodeAtPoint(location) == back || nodeAtPoint(location) == backLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                let mainScene = GameScene(size: self.size)
                let transition = SKTransition.flipVerticalWithDuration(0.5)
                mainScene.scaleMode = SKSceneScaleMode.ResizeFill
                self.scene!.view?.presentScene(mainScene, transition: transition)
                
            }
            
        }
        
    }
    
}
