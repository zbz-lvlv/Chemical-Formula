//
//  GameScene.swift
//  Chem Formula
//
//  Created by ZBZ on 17/12/15.
//  Copyright (c) 2015 ___ZHANG_BOZHENG___. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    
    var backgroundImage = SKSpriteNode(imageNamed: "bg");
    
    var title = SKSpriteNode();
    var titleLabel = SKLabelNode();
    
    var onePlayer = SKSpriteNode();
    var onePlayerTitle = SKLabelNode();
    var onePlayerInfo = SKLabelNode();
    
    var twoPlayer = SKSpriteNode();
    var twoPlayerTitle = SKLabelNode();
    var twoPlayerInfo = SKLabelNode();
    
    var achievementsSettings = SKSpriteNode();
    var achievements = SKLabelNode();
    var settings = SKLabelNode();
    
    let ionsObj = Ions();
    
    var screenHeight: CGFloat = 0.0;
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        screenHeight = self.view!.frame.size.height;
        
        //initialize ions
        ionsObj.initializeNullValues();
        ionsObj.createCation();
        ionsObj.createAnion();
        
        self.backgroundColor = UIColor(red: 0.7, green: 0.35, blue: 0, alpha: 1)
        
        backgroundImage.position = CGPointMake(self.view!.frame.size.width / 2, screenHeight / 2)
        backgroundImage.size = CGSizeMake(self.view!.frame.size.width, screenHeight);
        self.addChild(backgroundImage)
        backgroundImage.runAction(SKAction.fadeAlphaTo(0.2, duration: 0));
        
        onePlayer.size = CGSizeMake(self.view!.frame.size.width - 2, screenHeight / 3 - 2)
        onePlayer.position = CGPointMake(self.view!.frame.size.width / 2, 5 * screenHeight / 6);
        onePlayer.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        onePlayerTitle.text = "1 Player"
        onePlayerTitle.fontSize = 36;
        onePlayerTitle.fontName = "Chalkboard SE"
        onePlayerTitle.fontColor = self.backgroundColor;
        onePlayerTitle.horizontalAlignmentMode = .Center
        onePlayerTitle.verticalAlignmentMode = .Center
        onePlayerTitle.position = CGPointMake(onePlayerTitle.position.x, onePlayerTitle.position.y + 22)
        onePlayer.addChild(onePlayerTitle)
        
        onePlayerInfo.text = "3 different game modes"
        onePlayerInfo.fontSize = 15;
        onePlayerInfo.fontName = "Chalkboard SE"
        onePlayerInfo.fontColor = self.backgroundColor;
        onePlayerInfo.horizontalAlignmentMode = .Center
        onePlayerInfo.verticalAlignmentMode = .Center
        onePlayerInfo.position = CGPointMake(onePlayerInfo.position.x, onePlayerInfo.position.y - 18)
        onePlayer.addChild(onePlayerInfo)
 
        self.addChild(onePlayer);
        
        twoPlayer.size = CGSizeMake(self.view!.frame.size.width - 2, screenHeight / 3 - 2)
        twoPlayer.position = CGPointMake(self.view!.frame.size.width / 2, 3 * screenHeight / 6);
        twoPlayer.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        twoPlayerTitle.text = "2 Players"
        twoPlayerTitle.fontSize = 36;
        twoPlayerTitle.fontName = "Chalkboard SE"
        twoPlayerTitle.fontColor = self.backgroundColor;
        twoPlayerTitle.horizontalAlignmentMode = .Center
        twoPlayerTitle.verticalAlignmentMode = .Center
        twoPlayerTitle.position = CGPointMake(twoPlayerTitle.position.x, twoPlayerTitle.position.y + 22)
        twoPlayer.addChild(twoPlayerTitle)
        
        twoPlayerInfo.text = String(Settings.qnNo2Play) + " correct formulas"
        twoPlayerInfo.fontSize = 15;
        twoPlayerInfo.fontName = "Chalkboard SE"
        twoPlayerInfo.fontColor = self.backgroundColor;
        twoPlayerInfo.horizontalAlignmentMode = .Center
        twoPlayerInfo.verticalAlignmentMode = .Center
        twoPlayerInfo.position = CGPointMake(twoPlayerInfo.position.x, twoPlayerInfo.position.y - 18)
        twoPlayer.addChild(twoPlayerInfo)
        
        self.addChild(twoPlayer);

        achievements.text = "Achievements &"
        achievements.fontSize = 30
        achievements.fontName = "Chalkboard SE"
        achievements.fontColor = self.backgroundColor;
        achievements.horizontalAlignmentMode = .Center
        achievements.verticalAlignmentMode = .Center
        achievements.position = CGPointMake(achievements.position.x, achievements.position.y + 20)
        
        achievementsSettings.addChild(achievements)
        
        settings.text = "Settings"
        settings.fontSize = 30
        settings.fontName = "Chalkboard SE"
        settings.fontColor = self.backgroundColor;
        settings.horizontalAlignmentMode = .Center
        settings.verticalAlignmentMode = .Center
        settings.position = CGPointMake(settings.position.x, settings.position.y - 20)
        
        achievementsSettings.addChild(settings)
        
        achievementsSettings.size = CGSizeMake(self.view!.frame.size.width - 2, screenHeight / 3 - 2)
        achievementsSettings.position = CGPointMake(self.view!.frame.size.width / 2, 1 * screenHeight / 6);
        achievementsSettings.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(achievementsSettings)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if(nodeAtPoint(location) == onePlayer || nodeAtPoint(location) == onePlayerInfo || nodeAtPoint(location) == onePlayerTitle){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                let onePlayerScene = OnePlayer(size: self.size)
                let transition = SKTransition.flipVerticalWithDuration(0.5)
                onePlayerScene.scaleMode = SKSceneScaleMode.ResizeFill
                self.scene!.view?.presentScene(onePlayerScene, transition: transition)
                
            }
            
            else if(nodeAtPoint(location) == twoPlayer || nodeAtPoint(location) == twoPlayerInfo || nodeAtPoint(location) == twoPlayerTitle){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                let twoPlayerScene = TwoPlayer(size: self.size)
                let transition = SKTransition.flipVerticalWithDuration(0.5)
                twoPlayerScene.scaleMode = SKSceneScaleMode.ResizeFill
                self.scene!.view?.presentScene(twoPlayerScene, transition: transition)
                
            }
            
            else if(nodeAtPoint(location) == achievementsSettings || nodeAtPoint(location) == achievements || nodeAtPoint(location) == settings){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                let achievementsSettingsScene = AchievementsSettings(size: self.size)
                let transition = SKTransition.flipVerticalWithDuration(0.5)
                achievementsSettingsScene.scaleMode = SKSceneScaleMode.ResizeFill
                self.scene!.view?.presentScene(achievementsSettingsScene, transition: transition)
                
            }
        
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
