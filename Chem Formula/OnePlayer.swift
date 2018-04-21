//
//  GameScene.swift
//  Chem Formula
//
//  Created by ZBZ on 17/12/15.
//  Copyright (c) 2015 ___ZHANG_BOZHENG___. All rights reserved.
//

import SpriteKit

class OnePlayer: SKScene {
    
    var backgroundImage = SKSpriteNode(imageNamed: "bg");

    var noMistakes = SKSpriteNode();
    var noMistakesTitle = SKLabelNode();
    var noMistakesInfo = SKLabelNode();
    
    var timedPractice = SKSpriteNode();
    var timedPracticeTitle = SKLabelNode();
    var timedPracticeInfo = SKLabelNode();
    
    var freeplay = SKSpriteNode();
    var freeplayTitle = SKLabelNode();
    var freeplayInfo = SKLabelNode();
    
    var back = SKSpriteNode();
    var backLabel = SKLabelNode();
    
    var screenHeight: CGFloat = 0.0;
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        screenHeight = self.view!.frame.size.height;
        
        self.backgroundColor = UIColor(red: 0.7, green: 0.35, blue: 0, alpha: 1)
        
        backgroundImage.position = CGPointMake(self.view!.frame.size.width / 2, screenHeight / 2)
        backgroundImage.size = CGSizeMake(self.view!.frame.size.width, screenHeight);
        self.addChild(backgroundImage)
        backgroundImage.runAction(SKAction.fadeAlphaTo(0.2, duration: 0));
        
        noMistakes.size = CGSizeMake(self.view!.frame.size.width - 2, 6 * screenHeight / 20 - 2)
        noMistakes.position = CGPointMake(self.view!.frame.size.width / 2, 17 * screenHeight / 20);
        noMistakes.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        noMistakesTitle.text = "No Mistakes"
        noMistakesTitle.fontSize = 36;
        noMistakesTitle.fontName = "Chalkboard SE"
        noMistakesTitle.fontColor = self.backgroundColor;
        noMistakesTitle.horizontalAlignmentMode = .Center
        noMistakesTitle.verticalAlignmentMode = .Center
        noMistakesTitle.position = CGPointMake(noMistakesTitle.position.x, noMistakesTitle.position.y + 20)
        noMistakes.addChild(noMistakesTitle)
        
        noMistakesInfo.text = "One mistake and it's game over";
        noMistakesInfo.fontSize = 15;
        noMistakesInfo.fontName = "Chalkboard SE"
        noMistakesInfo.fontColor = self.backgroundColor;
        noMistakesInfo.horizontalAlignmentMode = .Center
        noMistakesInfo.verticalAlignmentMode = .Center
        noMistakesInfo.position = CGPointMake(noMistakesInfo.position.x, noMistakesInfo.position.y - 20)
        noMistakes.addChild(noMistakesInfo)
        
        self.addChild(noMistakes);
        
        timedPractice.size = CGSizeMake(self.view!.frame.size.width - 2, 6 * screenHeight / 20 - 2)
        timedPractice.position = CGPointMake(self.view!.frame.size.width / 2, 11 * screenHeight / 20);
        timedPractice.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        timedPracticeTitle.text = "Timed Practice"
        timedPracticeTitle.fontSize = 36;
        timedPracticeTitle.fontName = "Chalkboard SE"
        timedPracticeTitle.fontColor = self.backgroundColor;
        timedPracticeTitle.horizontalAlignmentMode = .Center
        timedPracticeTitle.verticalAlignmentMode = .Center
        timedPracticeTitle.position = CGPointMake(timedPracticeTitle.position.x, timedPracticeTitle.position.y + 20)
        timedPractice.addChild(timedPracticeTitle)
        
        timedPracticeInfo.text = "Every mistake forfeits 1 second";
        timedPracticeInfo.fontSize = 15;
        timedPracticeInfo.fontName = "Chalkboard SE"
        timedPracticeInfo.fontColor = self.backgroundColor;
        timedPracticeInfo.horizontalAlignmentMode = .Center
        timedPracticeInfo.verticalAlignmentMode = .Center
        timedPracticeInfo.position = CGPointMake(timedPracticeInfo.position.x, timedPracticeInfo.position.y - 20)
        timedPractice.addChild(timedPracticeInfo)
        
        self.addChild(timedPractice);
        
        freeplay.size = CGSizeMake(self.view!.frame.size.width - 2, 6 * screenHeight / 20 - 2)
        freeplay.position = CGPointMake(self.view!.frame.size.width / 2, 5 * screenHeight / 20);
        freeplay.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        freeplayTitle.text = "Freeplay";
        freeplayTitle.fontSize = 36;
        freeplayTitle.fontName = "Chalkboard SE"
        freeplayTitle.fontColor = self.backgroundColor;
        freeplayTitle.horizontalAlignmentMode = .Center
        freeplayTitle.verticalAlignmentMode = .Center
        freeplayTitle.position = CGPointMake(freeplayTitle.position.x, freeplayTitle.position.y + 20);
        freeplay.addChild(freeplayTitle)
        
        freeplayInfo.text = "Total formulas formed: " + String(Settings.qnCompleted);
        freeplayInfo.fontSize = 15;
        freeplayInfo.fontName = "Chalkboard SE"
        freeplayInfo.fontColor = self.backgroundColor;
        freeplayInfo.horizontalAlignmentMode = .Center
        freeplayInfo.verticalAlignmentMode = .Center
        freeplayInfo.position = CGPointMake(freeplayInfo.position.x, freeplayInfo.position.y - 20)
        freeplay.addChild(freeplayInfo)
        
        self.addChild(freeplay);
        
        backLabel.text = "←"
        backLabel.fontSize = 30;
        backLabel.fontName = "Chalkboard SE"
        backLabel.fontColor = self.backgroundColor;
        backLabel.horizontalAlignmentMode = .Center
        backLabel.verticalAlignmentMode = .Center
        
        back.addChild(backLabel)
        
        back.size = CGSizeMake(self.view!.frame.size.width - 1, 2 * screenHeight / 20 - 1)
        back.position = CGPointMake(2 * self.view!.frame.size.width / 4, 1 * screenHeight / 20)
        back.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(back)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if(nodeAtPoint(location) == noMistakes || nodeAtPoint(location) == noMistakesInfo || nodeAtPoint(location) == noMistakesTitle){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                let noMistakesScene = NoMistakes(size: self.size)
                let transition = SKTransition.flipVerticalWithDuration(0.5)
                noMistakesScene.scaleMode = SKSceneScaleMode.ResizeFill
                self.scene!.view?.presentScene(noMistakesScene, transition: transition)
                
            }
                
            else if(nodeAtPoint(location) == timedPractice || nodeAtPoint(location) == timedPracticeInfo || nodeAtPoint(location) == timedPracticeTitle){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                let timedPracticeScene = TimedPractice(size: self.size)
                let transition = SKTransition.flipVerticalWithDuration(0.5)
                timedPracticeScene.scaleMode = SKSceneScaleMode.ResizeFill
                self.scene!.view?.presentScene(timedPracticeScene, transition: transition)
                
            }
                
            else if(nodeAtPoint(location) == freeplay || nodeAtPoint(location) == freeplayTitle){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                let freeplayScene = Freeplay(size: self.size)
                let transition = SKTransition.flipVerticalWithDuration(0.5)
                freeplayScene.scaleMode = SKSceneScaleMode.ResizeFill
                self.scene!.view?.presentScene(freeplayScene, transition: transition)
                
            }
            
            else if(nodeAtPoint(location) == back || nodeAtPoint(location) == backLabel){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                let mainScene = GameScene(size: self.size)
                let transition = SKTransition.flipVerticalWithDuration(0.5)
                mainScene.scaleMode = SKSceneScaleMode.ResizeFill
                self.scene!.view?.presentScene(mainScene, transition: transition)
                
            }
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
