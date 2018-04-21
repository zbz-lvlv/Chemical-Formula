//
//  TwoPlayer.swift
//  Chem Formula
//
//  Created by ZBZ on 20/12/15.
//  Copyright © 2015 ___ZHANG_BOZHENG___. All rights reserved.
//

import Foundation
import SpriteKit
import AudioToolbox

class TwoPlayer: SKScene {
    
    var title = SKSpriteNode();
    var titleLabel = SKLabelNode();
    
    var backButton = SKSpriteNode();
    var backText = SKLabelNode();
    
    var restartButton = SKSpriteNode();
    var restartText = SKLabelNode();
    
    var cationSymbolsOne = [SKSpriteNode]();
    var cationNumbersOne = [SKSpriteNode]();
    var anionSymbolsOne = [SKSpriteNode]();
    var anionNumbersOne = [SKSpriteNode]();
    
    var cationSymbolsTextOne = [SKLabelNode]();
    var cationNumbersTextOne = [SKLabelNode]();
    var anionSymbolsTextOne = [SKLabelNode]();
    var anionNumbersTextOne = [SKLabelNode]();
    
    var questionSpriteOne = SKSpriteNode();
    var questionLabelOne = SKLabelNode();
    
    var scoreSpriteMeOne = SKSpriteNode();
    var scoreLabelMeOne = SKLabelNode();
    
    var scoreSpriteHimOne = SKSpriteNode();
    var scoreLabelHimOne = SKLabelNode();
    
    var cationSymbolsTwo = [SKSpriteNode]();
    var cationNumbersTwo = [SKSpriteNode]();
    var anionSymbolsTwo = [SKSpriteNode]();
    var anionNumbersTwo = [SKSpriteNode]();
    
    var cationSymbolsTextTwo = [SKLabelNode]();
    var cationNumbersTextTwo = [SKLabelNode]();
    var anionSymbolsTextTwo = [SKLabelNode]();
    var anionNumbersTextTwo = [SKLabelNode]();
    
    var questionSpriteTwo = SKSpriteNode();
    var questionLabelTwo = SKLabelNode();
    
    var scoreSpriteMeTwo = SKSpriteNode();
    var scoreLabelMeTwo = SKLabelNode();
    
    var scoreSpriteHimTwo = SKSpriteNode();
    var scoreLabelHimTwo = SKLabelNode();
    
    var noOfQuestions = Settings.qnNo2Play;
    
    var cationName = [String]();
    var cationSymbol = [String]();
    var anionName = [String]();
    var anionSymbol = [String]();
    
    var cationSeq = [Int]();
    var cationGrp = [Int]();
    var anionSeq = [Int]();
    var anionGrp = [Int]();
    
    var noOfCation = [Int]();
    var noOfAnion = [Int]();
    
    var correctCationSymbol = [Int]();
    var correctCationNumber = [Int]();
    var correctAnionSymbol = [Int]();
    var correctAnionNumber = [Int]();
    
    var cationSymbolGrp = [[Int]]();
    var anionSymbolGrp = [[Int]]();
    
    var cationSymbolStrings = [[String]]();
    var cationNumberStrings = [[String]]();
    var anionSymbolStrings = [[String]]();
    var anionNumberStrings = [[String]]();
    
    var noOfCationSelectedOne = 0;
    var noOfAnionSelectedOne = 0;
    
    var noOfCationSelectedTwo = 0;
    var noOfAnionSelectedTwo = 0;
    
    var correctCationSymbolSelectedOne = false;
    var correctCationNumberSelectedOne = false;
    var correctAnionSymbolSelectedOne = false;
    var correctAnionNumberSelectedOne = false;
    
    var correctCationSymbolSelectedTwo = false;
    var correctCationNumberSelectedTwo = false;
    var correctAnionSymbolSelectedTwo = false;
    var correctAnionNumberSelectedTwo = false;
    
    var playing = true;
    
    var playerOneQuestion = 0;
    var playerTwoQuestion = 0;
    
    var ionsObj = Ions();
    var ionToolsObj = IonTools();
    
    var backPressedOnce: Bool = false
    var restartPressedOnce: Bool = false
    
    var screenHeight: CGFloat = 0.0;
    
    override func didMoveToView(view: SKView) {
        
        self.view?.multipleTouchEnabled = true;
        
        screenHeight = self.view!.frame.size.height;
        
        self.backgroundColor = UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1)
        
        createUI()
        
        //question 1
        generateQuestion(0)
        displayQuestionOne(0)
        displayQuestionTwo(0)
        
    }
    
    func resetAllNonUIVariable(){
        
        noOfQuestions = Settings.qnNo2Play;
        
        cationName = [String]();
        cationSymbol = [String]();
        anionName = [String]();
        anionSymbol = [String]();
        
        cationSeq = [Int]();
        cationGrp = [Int]();
        anionSeq = [Int]();
        anionGrp = [Int]();
        
        noOfCation = [Int]();
        noOfAnion = [Int]();
        
        correctCationSymbol = [Int]();
        correctCationNumber = [Int]();
        correctAnionSymbol = [Int]();
        correctAnionNumber = [Int]();
        
        cationSymbolGrp = [[Int]]();
        anionSymbolGrp = [[Int]]();
        
        cationSymbolStrings = [[String]]();
        cationNumberStrings = [[String]]();
        anionSymbolStrings = [[String]]();
        anionNumberStrings = [[String]]();
        
        noOfCationSelectedOne = 0;
        noOfAnionSelectedOne = 0;
        
        noOfCationSelectedTwo = 0;
        noOfAnionSelectedTwo = 0;
        
        correctCationSymbolSelectedOne = false;
        correctCationNumberSelectedOne = false;
        correctAnionSymbolSelectedOne = false;
        correctAnionNumberSelectedOne = false;
        
        correctCationSymbolSelectedTwo = false;
        correctCationNumberSelectedTwo = false;
        correctAnionSymbolSelectedTwo = false;
        correctAnionNumberSelectedTwo = false;
        
        playing = true;
        
        playerOneQuestion = 0;
        playerTwoQuestion = 0;
        
        scoreLabelMeOne.text = "Me: " + String(playerOneQuestion)
        scoreLabelHimTwo.text = "Them: " + String(playerOneQuestion)
        
        scoreLabelMeTwo.text = "Me: " + String(playerOneQuestion)
        scoreLabelHimOne.text = "Them: " + String(playerOneQuestion)
        
        for(var c = 0; c < 3; c++){
            
            cationSymbolsOne[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            cationSymbolsTwo[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            anionSymbolsOne[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            anionSymbolsTwo[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
        }
        
        //question 1
        generateQuestion(0)
        displayQuestionOne(0)
        displayQuestionTwo(0)
        
    }
    
    func createUI(){
        
        //initialize ions
        ionsObj.initializeNullValues();
        ionsObj.createCation();
        ionsObj.createAnion();
        
        //initialize controls
        backText.text = "End Game"
        backText.fontSize = 20;
        backText.fontName = "Chalkboard SE"
        backText.fontColor = self.backgroundColor;
        backText.horizontalAlignmentMode = .Center
        backText.verticalAlignmentMode = .Center
        backButton.addChild(backText)
        
        backButton.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 9 - 1)
        backButton.position = CGPointMake(self.view!.frame.size.width / 4, 2 * screenHeight / 36)
        backButton.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        self.addChild(backButton)
        
        restartText.text = "New Game"
        restartText.fontSize = 20;
        restartText.fontName = "Chalkboard SE"
        restartText.fontColor = self.backgroundColor;
        restartText.horizontalAlignmentMode = .Center
        restartText.verticalAlignmentMode = .Center
        restartButton.addChild(restartText)
        
        restartButton.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 9 - 1)
        restartButton.position = CGPointMake(3 * self.view!.frame.size.width / 4, 2 * screenHeight / 36)
        restartButton.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        self.addChild(restartButton)
        
        //initialize options
        for(var c = 0; c < 3; c++){
            cationSymbolsOne.append(SKSpriteNode());
            
            cationSymbolsTextOne.append(SKLabelNode())
            cationSymbolsTextOne[c].fontSize = 20;
            cationSymbolsTextOne[c].fontName = "Chalkboard SE"
            cationSymbolsTextOne[c].fontColor = self.backgroundColor;
            cationSymbolsTextOne[c].horizontalAlignmentMode = .Center
            cationSymbolsTextOne[c].verticalAlignmentMode = .Center
            
            cationSymbolsOne[c].addChild(cationSymbolsTextOne[c])
            
            cationSymbolsOne[c].size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 9 - 1)
            cationSymbolsOne[c].position = CGPointMake(CGRectGetMidX(self.frame) - 1.0 * self.view!.frame.size.width / 4, (6 + 4 * CGFloat(c)) * screenHeight / 36)
            cationSymbolsOne[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(cationSymbolsOne[c])
            
            cationSymbolsTwo.append(SKSpriteNode());
            
            cationSymbolsTextTwo.append(SKLabelNode())
            cationSymbolsTextTwo[c].fontSize = 20;
            cationSymbolsTextTwo[c].fontName = "Chalkboard SE"
            cationSymbolsTextTwo[c].fontColor = self.backgroundColor;
            cationSymbolsTextTwo[c].horizontalAlignmentMode = .Center
            cationSymbolsTextTwo[c].verticalAlignmentMode = .Center
            cationSymbolsTextTwo[c].runAction(SKAction.rotateByAngle(CGFloat(M_PI), duration: 0))
            
            cationSymbolsTwo[c].addChild(cationSymbolsTextTwo[c])
            
            cationSymbolsTwo[c].size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 9 - 1)
            cationSymbolsTwo[c].position = CGPointMake(CGRectGetMidX(self.frame) + 1.0 * self.view!.frame.size.width / 4, (26 + 4 * CGFloat(c)) * screenHeight / 36)
            cationSymbolsTwo[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(cationSymbolsTwo[c])
        }
        /*
        for(var c = 0; c < 3; c++){
            cationNumbersOne.append(SKSpriteNode());
            
            cationNumbersTextOne.append(SKLabelNode())
            cationNumbersTextOne[c].fontSize = 20;
            cationNumbersTextOne[c].fontName = "Chalkboard SE"
            cationNumbersTextOne[c].fontColor = self.backgroundColor;
            cationNumbersTextOne[c].horizontalAlignmentMode = .Center
            cationNumbersTextOne[c].verticalAlignmentMode = .Center
            
            cationNumbersOne[c].addChild(cationNumbersTextOne[c])
            
            cationNumbersOne[c].size = CGSizeMake(self.view!.frame.size.width / 4 - 1, screenHeight / 9 - 1)
            cationNumbersOne[c].position = CGPointMake(CGRectGetMidX(self.frame) - 0.5 * self.view!.frame.size.width / 4, (6 + 4 * CGFloat(c)) * screenHeight / 36)
            cationNumbersOne[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(cationNumbersOne[c])
            
            cationNumbersTwo.append(SKSpriteNode());
            
            cationNumbersTextTwo.append(SKLabelNode())
            cationNumbersTextTwo[c].fontSize = 20;
            cationNumbersTextTwo[c].fontName = "Chalkboard SE"
            cationNumbersTextTwo[c].fontColor = self.backgroundColor;
            cationNumbersTextTwo[c].horizontalAlignmentMode = .Center
            cationNumbersTextTwo[c].verticalAlignmentMode = .Center
            cationNumbersTextTwo[c].runAction(SKAction.rotateByAngle(CGFloat(M_PI), duration: 0))
            
            cationNumbersTwo[c].addChild(cationNumbersTextTwo[c])
            
            cationNumbersTwo[c].size = CGSizeMake(self.view!.frame.size.width / 4 - 1, screenHeight / 9 - 1)
            cationNumbersTwo[c].position = CGPointMake(CGRectGetMidX(self.frame) + 0.5 * self.view!.frame.size.width / 4, (26 + 4 * CGFloat(c)) * screenHeight / 36)
            cationNumbersTwo[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(cationNumbersTwo[c])
        }
        */
        
        for(var c = 0; c < 3; c++){
            anionSymbolsOne.append(SKSpriteNode());
            
            anionSymbolsTextOne.append(SKLabelNode())
            anionSymbolsTextOne[c].fontSize = 20;
            anionSymbolsTextOne[c].fontName = "Chalkboard SE"
            anionSymbolsTextOne[c].fontColor = self.backgroundColor;
            anionSymbolsTextOne[c].horizontalAlignmentMode = .Center
            anionSymbolsTextOne[c].verticalAlignmentMode = .Center
            
            anionSymbolsOne[c].addChild(anionSymbolsTextOne[c])
            
            anionSymbolsOne[c].size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 9 - 1)
            anionSymbolsOne[c].position = CGPointMake(CGRectGetMidX(self.frame) + 1 * self.view!.frame.size.width / 4, (6 + 4 * CGFloat(c)) * screenHeight / 36)
            anionSymbolsOne[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(anionSymbolsOne[c])
            
            anionSymbolsTwo.append(SKSpriteNode());
            
            anionSymbolsTextTwo.append(SKLabelNode())
            anionSymbolsTextTwo[c].fontSize = 20;
            anionSymbolsTextTwo[c].fontName = "Chalkboard SE"
            anionSymbolsTextTwo[c].fontColor = self.backgroundColor;
            anionSymbolsTextTwo[c].horizontalAlignmentMode = .Center
            anionSymbolsTextTwo[c].verticalAlignmentMode = .Center
            anionSymbolsTextTwo[c].runAction(SKAction.rotateByAngle(CGFloat(M_PI), duration: 0))
            
            anionSymbolsTwo[c].addChild(anionSymbolsTextTwo[c])
            
            anionSymbolsTwo[c].size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 9 - 1)
            anionSymbolsTwo[c].position = CGPointMake(CGRectGetMidX(self.frame) - 1 * self.view!.frame.size.width / 4, (26 + 4 * CGFloat(c)) * screenHeight / 36)
            anionSymbolsTwo[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(anionSymbolsTwo[c])
        }
        /*
        for(var c = 0; c < 3; c++){
            anionNumbersOne.append(SKSpriteNode());
            
            anionNumbersTextOne.append(SKLabelNode())
            anionNumbersTextOne[c].fontSize = 20;
            anionNumbersTextOne[c].fontName = "Chalkboard SE"
            anionNumbersTextOne[c].fontColor = self.backgroundColor;
            anionNumbersTextOne[c].horizontalAlignmentMode = .Center
            anionNumbersTextOne[c].verticalAlignmentMode = .Center
            
            anionNumbersOne[c].addChild(anionNumbersTextOne[c])
            
            anionNumbersOne[c].size = CGSizeMake(self.view!.frame.size.width / 4 - 1, screenHeight / 9 - 1)
            anionNumbersOne[c].position = CGPointMake(CGRectGetMidX(self.frame) + 1.5 * self.view!.frame.size.width / 4, (6 + 4 * CGFloat(c)) * screenHeight / 36)
            anionNumbersOne[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(anionNumbersOne[c])
            
            anionNumbersTwo.append(SKSpriteNode());
            
            anionNumbersTextTwo.append(SKLabelNode())
            anionNumbersTextTwo[c].fontSize = 20;
            anionNumbersTextTwo[c].fontName = "Chalkboard SE"
            anionNumbersTextTwo[c].fontColor = self.backgroundColor;
            anionNumbersTextTwo[c].horizontalAlignmentMode = .Center
            anionNumbersTextTwo[c].verticalAlignmentMode = .Center
            anionNumbersTextTwo[c].runAction(SKAction.rotateByAngle(CGFloat(M_PI), duration: 0))
            
            anionNumbersTwo[c].addChild(anionNumbersTextTwo[c])
            
            anionNumbersTwo[c].size = CGSizeMake(self.view!.frame.size.width / 4 - 1, screenHeight / 9 - 1)
            anionNumbersTwo[c].position = CGPointMake(CGRectGetMidX(self.frame) - 1.5 * self.view!.frame.size.width / 4, (26 + 4 * CGFloat(c)) * screenHeight / 36)
            anionNumbersTwo[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(anionNumbersTwo[c])
        }
        */
        
        //initialize scoreboard/question
        questionLabelOne.fontSize = 20;
        questionLabelOne.fontName = "Chalkboard SE"
        questionLabelOne.fontColor = self.backgroundColor;
        questionLabelOne.horizontalAlignmentMode = .Center
        questionLabelOne.verticalAlignmentMode = .Center
        questionSpriteOne.addChild(questionLabelOne);
        
        scoreLabelMeOne.text = "Me: 0"
        scoreLabelMeOne.fontSize = 12;
        scoreLabelMeOne.fontName = "Chalkboard SE"
        scoreLabelMeOne.fontColor = self.backgroundColor;
        scoreLabelMeOne.horizontalAlignmentMode = .Left
        scoreLabelMeOne.verticalAlignmentMode = .Top
        scoreLabelMeOne.position = CGPointMake(-(self.view!.frame.size.width / 2), screenHeight / 18)
        questionSpriteOne.addChild(scoreLabelMeOne);
        
        scoreLabelHimOne.text = "Them: 0"
        scoreLabelHimOne.fontSize = 12;
        scoreLabelHimOne.fontName = "Chalkboard SE"
        scoreLabelHimOne.fontColor = self.backgroundColor;
        scoreLabelHimOne.horizontalAlignmentMode = .Right
        scoreLabelHimOne.verticalAlignmentMode = .Top
        scoreLabelHimOne.position = CGPointMake(self.view!.frame.size.width / 2, screenHeight / 18)
        questionSpriteOne.addChild(scoreLabelHimOne);
        
        questionSpriteOne.size = CGSizeMake(self.view!.frame.size.width - 1, screenHeight / 9 - 1)
        questionSpriteOne.position = CGPointMake(CGRectGetMidX(self.frame), 18 * screenHeight / 36)
        questionSpriteOne.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(questionSpriteOne)
        
        questionLabelTwo.fontSize = 20;
        questionLabelTwo.fontName = "Chalkboard SE"
        questionLabelTwo.fontColor = self.backgroundColor;
        questionLabelTwo.horizontalAlignmentMode = .Center
        questionLabelTwo.verticalAlignmentMode = .Center
        questionLabelTwo.runAction(SKAction.rotateByAngle(CGFloat(M_PI), duration: 0))
        questionSpriteTwo.addChild(questionLabelTwo);
        
        scoreLabelMeTwo.text = "Me: 0"
        scoreLabelMeTwo.fontSize = 12;
        scoreLabelMeTwo.fontName = "Chalkboard SE"
        scoreLabelMeTwo.fontColor = self.backgroundColor;
        scoreLabelMeTwo.horizontalAlignmentMode = .Left
        scoreLabelMeTwo.verticalAlignmentMode = .Top
        scoreLabelMeTwo.position = CGPointMake(self.view!.frame.size.width / 2, -(screenHeight / 18))
        scoreLabelMeTwo.runAction(SKAction.rotateByAngle(CGFloat(M_PI), duration: 0))
        questionSpriteTwo.addChild(scoreLabelMeTwo);
        
        scoreLabelHimTwo.text = "Them: 0"
        scoreLabelHimTwo.fontSize = 12;
        scoreLabelHimTwo.fontName = "Chalkboard SE"
        scoreLabelHimTwo.fontColor = self.backgroundColor;
        scoreLabelHimTwo.horizontalAlignmentMode = .Right
        scoreLabelHimTwo.verticalAlignmentMode = .Top
        scoreLabelHimTwo.position = CGPointMake(-(self.view!.frame.size.width / 2), -(screenHeight / 18))
        scoreLabelHimTwo.runAction(SKAction.rotateByAngle(CGFloat(M_PI), duration: 0))
        questionSpriteTwo.addChild(scoreLabelHimTwo);
        
        questionSpriteTwo.size = CGSizeMake(self.view!.frame.size.width - 1, screenHeight / 9 - 1)
        questionSpriteTwo.position = CGPointMake(CGRectGetMidX(self.frame), 22 * screenHeight / 36)
        questionSpriteTwo.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(questionSpriteTwo)
        
    }
    
    func generateQuestion(var c: Int){
        
        //questions
        var fail = true;
            
        //initialize arrays
        cationSeq.append(0)
        cationGrp.append(0)
        cationName.append("")
        cationSymbol.append("")
        
        anionSeq.append(0)
        anionGrp.append(0)
        anionName.append("")
        anionSymbol.append("")
        
        noOfCation.append(0)
        noOfAnion.append(0)
        
        correctCationSymbol.append(0)
        correctCationNumber.append(0)
        correctAnionSymbol.append(0)
        correctAnionNumber.append(0)
        
        var strArray = [String]();
        for(var i = 0; i < 3; i++){
            strArray.append("")
        }
        
        var intArray = [Int]();
        for(var i = 0; i < 3; i++){
            intArray.append(0);
        }
        
        cationSymbolGrp.append(intArray)
        anionSymbolGrp.append(intArray)
        cationSymbolStrings.append(strArray)
        cationNumberStrings.append(strArray)
        anionSymbolStrings.append(strArray)
        anionNumberStrings.append(strArray)
        
        //generating questions
        while(fail){
            
            cationSeq[c] = Int(arc4random_uniform(Settings.noOfCationSeq[Settings.difficulty]));
            cationGrp[c] = Int(arc4random_uniform(Settings.noOfCationGrp[Settings.difficulty]));
            
            cationName[c] = ionsObj.getCationName(cationSeq[c], group: cationGrp[c]);
            cationSymbol[c] = ionsObj.getCationSymbol(cationSeq[c], group: cationGrp[c]);
            
            anionSeq[c] = Int(arc4random_uniform(Settings.noOfAnionSeq[Settings.difficulty]));
            anionGrp[c] = Int(arc4random_uniform(Settings.noOfAnionGrp[Settings.difficulty]));
            
            anionName[c] = ionsObj.getAnionName(anionSeq[c], group: anionGrp[c]);
            anionSymbol[c] = ionsObj.getAnionSymbol(anionSeq[c], group: anionGrp[c]);
            
            if(cationName[c] != "" && anionName[c] != "" && !ionToolsObj.getException(cationSymbol[c], anion: anionSymbol[c])){
                fail = false;
            }
            
        }
        
        //solving questions
        noOfCation[c] = anionGrp[c] + 1;
        noOfAnion[c] = cationGrp[c] + 1;
        
        if(noOfAnion[c] == noOfCation[c]){
            noOfAnion[c] = 1;
            noOfCation[c] = 1;
        }
            
        else if (ionToolsObj.getHCF(noOfCation[c], noOfAnion: noOfAnion[c]) > 1)
        {
            let hcf = ionToolsObj.getHCF(noOfCation[c], noOfAnion: noOfAnion[c]);
            noOfCation[c] /= hcf
            noOfAnion[c] /= hcf
        }
        
        //randomise correct ans
        correctCationSymbol[c] = Int(arc4random_uniform(3));
        correctCationNumber[c] = Int(arc4random_uniform(3));
        correctAnionSymbol[c] = Int(arc4random_uniform(3));
        correctAnionNumber[c] = Int(arc4random_uniform(3));
        
        var cationSymbols = ["","",""];
        var anionSymbols = ["","",""];
        
        //wrong answers
        for(var c2 = 0; c2 < 3; c2++){
            if(c2 != correctCationSymbol[c]){
                
                var cationSymbolSeq = Int(arc4random_uniform(Settings.noOfCationSeq[Settings.difficulty]));
                var cationSymbolGrp = Int(arc4random_uniform(Settings.noOfCationGrp[Settings.difficulty]));
                cationSymbols[c2] = ionsObj.getCationSymbol(cationSymbolSeq, group: cationSymbolGrp)
                
                while(cationSymbols[c2] == "" || cationSymbols[c2] == cationSymbol[c] || ionToolsObj.getRepeated(cationSymbols[0], s1: cationSymbols[1], s2: cationSymbols[2], s3: "", c: c2)){
                    
                    cationSymbolSeq = Int(arc4random_uniform(Settings.noOfCationSeq[Settings.difficulty]));
                    cationSymbolGrp = Int(arc4random_uniform(Settings.noOfCationGrp[Settings.difficulty]));
                    cationSymbols[c2] = ionsObj.getCationSymbol(cationSymbolSeq, group: cationSymbolGrp);
                    
                }
                
                self.cationSymbolGrp[c][c2] = cationSymbolGrp;
                cationSymbolStrings[c][c2] = ionsObj.getCationSymbol(cationSymbolSeq, group: cationSymbolGrp)
                
                
            }
            
            if(c2 != correctCationNumber[c]){
                
                var cationNumber = noOfCation[c];
                
                while(cationNumber == noOfCation[c]){
                    cationNumber = Int(arc4random_uniform(3) + 1);
                }
                
                cationNumberStrings[c][c2] = String(cationNumber)
            }
            
            if(c2 != correctAnionSymbol[c]){
                
                var anionSymbolSeq = Int(arc4random_uniform(Settings.noOfAnionSeq[Settings.difficulty]));
                var anionSymbolGrp = Int(arc4random_uniform(Settings.noOfAnionGrp[Settings.difficulty]));
                anionSymbols[c2] = ionsObj.getAnionSymbol(anionSymbolSeq, group: anionSymbolGrp)
                
                while(anionSymbols[c2] == "" || anionSymbols[c2] == anionSymbol[c] || ionToolsObj.getRepeated(anionSymbols[0], s1: anionSymbols[1], s2: anionSymbols[2], s3: "", c: c2)){
                    
                    anionSymbolSeq = Int(arc4random_uniform(Settings.noOfAnionSeq[Settings.difficulty]));
                    anionSymbolGrp = Int(arc4random_uniform(Settings.noOfAnionGrp[Settings.difficulty]));
                    anionSymbols[c2] = ionsObj.getAnionSymbol(anionSymbolSeq, group: anionSymbolGrp)
                    
                }
                
                self.anionSymbolGrp[c][c2] = anionSymbolGrp;
                anionSymbolStrings[c][c2] = ionsObj.getAnionSymbol(anionSymbolSeq, group: anionSymbolGrp)
                
            }
            
            if(c2 != correctAnionNumber[c]){
                var anionNumberAll = 0;
                var anionNumber = noOfAnion[c];
                
                if(c2 == 0){
                    while(anionNumber == noOfAnion[c]){
                        anionNumberAll = Int(arc4random_uniform(49));
                        anionNumber = 7 - Int(sqrt(Double(anionNumberAll)))
                    }
                }
                
                if(c2 == 1){
                    while(anionNumber == noOfAnion[c] || String(anionNumber) == anionNumberStrings[c][c2 - 1]){
                        anionNumberAll = Int(arc4random_uniform(49));
                        anionNumber = 7 - Int(sqrt(Double(anionNumberAll)))
                    }
                }
                
                if(c2 == 2){
                    while(anionNumber == noOfAnion[c] || String(anionNumber) == anionNumberStrings[c][c2 - 1] || String(anionNumber) == anionNumberStrings[c][c2 - 2]){
                        anionNumberAll = Int(arc4random_uniform(49));
                        anionNumber = 7 - Int(sqrt(Double(anionNumberAll)))
                    }
                }
                
                anionNumberStrings[c][c2] = String(anionNumber)
            }
        }
        
    }
    
    func displayQuestionOne(var c: Int){
        
        questionLabelOne.text = cationName[c] + " " + anionName[c]
        
        cationSymbolsTextOne[correctCationSymbol[c]].text = cationSymbol[c] + ionToolsObj.addCharge(cationGrp[c] + 1, positive: 1);
        //cationNumbersTextOne[correctCationNumber[c]].text = String(noOfCation[c])
        anionSymbolsTextOne[correctAnionSymbol[c]].text = anionSymbol[c] + ionToolsObj.addCharge(anionGrp[c] + 1, positive: 0);
        //anionNumbersTextOne[correctAnionNumber[c]].text = String(noOfAnion[c])
        
        for(var c2 = 0; c2 < 3; c2++){
            
            if(c2 != correctCationSymbol[c]){
                cationSymbolsTextOne[c2].text = cationSymbolStrings[c][c2] + ionToolsObj.addCharge(cationSymbolGrp[c][c2] + 1, positive: 1);
            }
            
            /*
            if(c2 != correctCationNumber[c]){
                cationNumbersTextOne[c2].text = cationNumberStrings[c][c2]
            }
            */
            
            if(c2 != correctAnionSymbol[c]){
                anionSymbolsTextOne[c2].text = anionSymbolStrings[c][c2] + ionToolsObj.addCharge(anionSymbolGrp[c][c2] + 1, positive: 0);
            }
            
            /*
            if(c2 != correctAnionNumber[c]){
                anionNumbersTextOne[c2].text = anionNumberStrings[c][c2]
            }
            */
            
        }
        
    }
    
    func displayQuestionTwo(var c: Int){
        
        questionLabelTwo.text = cationName[c] + " " + anionName[c]
        
        cationSymbolsTextTwo[correctCationSymbol[c]].text = cationSymbol[c] + ionToolsObj.addCharge(cationGrp[c] + 1, positive: 1);
        //cationNumbersTextTwo[correctCationNumber[c]].text = String(noOfCation[c]);
        anionSymbolsTextTwo[correctAnionSymbol[c]].text = anionSymbol[c] + ionToolsObj.addCharge(anionGrp[c] + 1, positive: 0);
        //anionNumbersTextTwo[correctAnionNumber[c]].text = String(noOfAnion[c]);
        
        for(var c2 = 0; c2 < 3; c2++){
            
            if(c2 != correctCationSymbol[c]){
                cationSymbolsTextTwo[c2].text = cationSymbolStrings[c][c2] + ionToolsObj.addCharge(cationSymbolGrp[c][c2] + 1, positive: 1);
            }
            /*
            if(c2 != correctCationNumber[c]){
                cationNumbersTextTwo[c2].text = cationNumberStrings[c][c2]
            }
            */
            if(c2 != correctAnionSymbol[c]){
                anionSymbolsTextTwo[c2].text = anionSymbolStrings[c][c2] + ionToolsObj.addCharge(anionSymbolGrp[c][c2] + 1, positive: 0);
            }
            /*
            if(c2 != correctAnionNumber[c]){
                anionNumbersTextTwo[c2].text = anionNumberStrings[c][c2]
            }
            */
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.locationInNode(self)
        
            if(nodeAtPoint(location) == backButton || nodeAtPoint(location) == backText){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false));
                
                if(backPressedOnce == false){
                    backText.text = "Again"
                    backPressedOnce = true;
                    
                    self.runAction(SKAction.sequence([SKAction.waitForDuration(1), SKAction.runBlock{
                        self.backText.text = "End Game"
                        self.backPressedOnce = false;
                        }]));
                }
                    
                else if(backPressedOnce == true){
                    backText.text = "End Game"
                    backPressedOnce = false;
                    
                    let mainScene = GameScene(size: self.size)
                    let transition = SKTransition.flipVerticalWithDuration(0.5)
                    mainScene.scaleMode = SKSceneScaleMode.ResizeFill
                    self.scene!.view?.presentScene(mainScene, transition: transition)
                }
                
            }
            
            if(nodeAtPoint(location) == restartButton || nodeAtPoint(location) == restartText){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
                if(restartPressedOnce == false){
                    restartText.text = "Again"
                    restartPressedOnce = true;
                    
                    self.runAction(SKAction.sequence([SKAction.waitForDuration(1), SKAction.runBlock{
                        self.restartText.text = "New Game"
                        self.restartPressedOnce = false;
                        }]));
                    
                }
                    
                else if(restartPressedOnce == true){
                    
                    restartText.text = "End Game"
                    restartPressedOnce = false;
                    
                    resetAllNonUIVariable();
                    
                }
                
            }
            
            if(playing == true){
                
                //player 1
                if(location.y > screenHeight / 9 && location.y < 4 * screenHeight / 9){
                    
                    print(nodeAtPoint(location))
                    
                    if(nodeAtPoint(location) == cationSymbolsOne[correctCationSymbol[playerOneQuestion]] || nodeAtPoint(location) == cationSymbolsTextOne[correctCationSymbol[playerOneQuestion]]){
                        
                        var symbolText = cationSymbol[playerOneQuestion] + ionToolsObj.addCharge(cationGrp[playerOneQuestion] + 1, positive: 1);
                        
                        noOfCationSelectedOne += 1;
                        
                        if(noOfCationSelectedOne >= 2){
                            
                            if(ionToolsObj.getNoOfCapitalLetters(cationSymbol[playerOneQuestion]) >= 2){
                                cationSymbolsTextOne[correctCationSymbol[playerOneQuestion]].text = "(" + symbolText + ")" + ionToolsObj.getSubscriptNumber(noOfCationSelectedOne);
                            }
                                
                            else{
                                cationSymbolsTextOne[correctCationSymbol[playerOneQuestion]].text = symbolText + ionToolsObj.getSubscriptNumber(noOfCationSelectedOne);
                            }
                            
                        }
                        
                        if(noOfCationSelectedOne == noOfCation[playerOneQuestion]){
                            correctCationNumberSelectedOne = true
                        }
                        else if(noOfCationSelectedOne > noOfCation[playerOneQuestion]){
                            wrongOne()
                        }
                        
                        correctSelection(cationSymbolsOne[correctCationSymbol[playerOneQuestion]])
                        correctCationSymbolSelectedOne = true;
                        
                    }
                        
                    else if(nodeAtPoint(location) == anionSymbolsOne[correctAnionSymbol[playerOneQuestion]] || nodeAtPoint(location) == anionSymbolsTextOne[correctAnionSymbol[playerOneQuestion]]){
                        
                        var symbolText = anionSymbol[playerOneQuestion] + ionToolsObj.addCharge(anionGrp[playerOneQuestion] + 1, positive: 0);
                        
                        noOfAnionSelectedOne += 1;
                        
                        if(noOfAnionSelectedOne >= 2){
                            
                            if(ionToolsObj.getNoOfCapitalLetters(anionSymbol[playerOneQuestion]) >= 2){
                                anionSymbolsTextOne[correctAnionSymbol[playerOneQuestion]].text = "(" + symbolText + ")" + ionToolsObj.getSubscriptNumber(noOfAnionSelectedOne);
                            }
                                
                            else{
                                anionSymbolsTextOne[correctAnionSymbol[playerOneQuestion]].text = symbolText + ionToolsObj.getSubscriptNumber(noOfAnionSelectedOne);
                            }
                            
                        }
                        
                        if(noOfAnionSelectedOne == noOfAnion[playerOneQuestion]){
                            correctAnionNumberSelectedOne = true
                        }
                        else if(noOfAnionSelectedOne > noOfAnion[playerOneQuestion]){
                            wrongOne()
                        }
                        
                        correctSelection(anionSymbolsOne[correctAnionSymbol[playerOneQuestion]])
                        correctAnionSymbolSelectedOne = true;
                    }
                    
                    //wrong
                    else{
                        wrongOne()
                    }
                
                }
                
                //player 2
                if(location.y > 6 * screenHeight / 9 && location.y < 9 * screenHeight / 9){
                    
                    if(nodeAtPoint(location) == cationSymbolsTwo[correctCationSymbol[playerTwoQuestion]] || nodeAtPoint(location) == cationSymbolsTextTwo[correctCationSymbol[playerTwoQuestion]]){
                        
                        var symbolText = cationSymbol[playerTwoQuestion] + ionToolsObj.addCharge(cationGrp[playerTwoQuestion] + 1, positive: 1);
                        
                        noOfCationSelectedTwo += 1;
                        
                        if(noOfCationSelectedTwo >= 2){
                            
                            if(ionToolsObj.getNoOfCapitalLetters(cationSymbol[playerTwoQuestion]) >= 2){
                                cationSymbolsTextTwo[correctCationSymbol[playerTwoQuestion]].text = "(" + symbolText + ")" + ionToolsObj.getSubscriptNumber(noOfCationSelectedTwo);
                            }
                            
                            else{
                                cationSymbolsTextTwo[correctCationSymbol[playerTwoQuestion]].text = symbolText + ionToolsObj.getSubscriptNumber(noOfCationSelectedTwo);
                            }
                            
                        }
                        
                        if(noOfCationSelectedTwo == noOfCation[playerTwoQuestion]){
                            correctCationNumberSelectedTwo = true
                        }
                        else if(noOfCationSelectedTwo > noOfCation[playerTwoQuestion]){
                            wrongTwo()
                        }
                        
                        correctSelection(cationSymbolsTwo[correctCationSymbol[playerTwoQuestion]])
                        correctCationSymbolSelectedTwo = true;
                        
                    }
                        
                    else if(nodeAtPoint(location) == anionSymbolsTwo[correctAnionSymbol[playerTwoQuestion]] || nodeAtPoint(location) == anionSymbolsTextTwo[correctAnionSymbol[playerTwoQuestion]]){
                        
                        var symbolText = anionSymbol[playerTwoQuestion] + ionToolsObj.addCharge(anionGrp[playerTwoQuestion] + 1, positive: 0);
                        
                        noOfAnionSelectedTwo += 1;
                        
                        if(noOfAnionSelectedTwo >= 2){
                            
                            if(ionToolsObj.getNoOfCapitalLetters(anionSymbol[playerTwoQuestion]) >= 2){
                                anionSymbolsTextTwo[correctAnionSymbol[playerTwoQuestion]].text = "(" + symbolText + ")" + ionToolsObj.getSubscriptNumber(noOfAnionSelectedTwo);
                            }
                                
                            else{
                                anionSymbolsTextTwo[correctAnionSymbol[playerTwoQuestion]].text = symbolText + ionToolsObj.getSubscriptNumber(noOfAnionSelectedTwo);
                            }
                            
                        }
                            
                        if(noOfAnionSelectedTwo == noOfAnion[playerTwoQuestion]){
                            correctAnionNumberSelectedTwo = true
                        }
                        else if(noOfAnionSelectedTwo > noOfAnion[playerTwoQuestion]){
                            wrongTwo()
                        }
                        
                        correctSelection(anionSymbolsTwo[correctAnionSymbol[playerTwoQuestion]])
                        correctAnionSymbolSelectedTwo = true;
                    }
                        
                    else{
                        wrongTwo()
                    }
                    
                }
                
            }
            
        }
        
    }
    
    func correctSelection(var spriteNode: SKSpriteNode){
        if(playing){
            self.runAction(SKAction.playSoundFileNamed("correct_selection.wav", waitForCompletion: false))
            spriteNode.color = UIColor(red: 0.8, green: 1, blue: 0.8, alpha: 1)
        }
    }
    
    func correctFormulaOne(){
        
        playerOneQuestion += 1;
        scoreLabelMeOne.text = "Me: " + String(playerOneQuestion)
        scoreLabelHimTwo.text = "Them: " + String(playerOneQuestion)
        
        if(playerOneQuestion >= noOfQuestions){
            
            winOne();
            
        }
        
        else{
                
            self.cationSymbolsOne[self.correctCationSymbol[self.playerOneQuestion - 1]].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            //self.cationNumbersOne[self.correctCationNumber[self.playerOneQuestion - 1]].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            self.anionSymbolsOne[self.correctAnionSymbol[self.playerOneQuestion - 1]].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            //self.anionNumbersOne[self.correctAnionNumber[self.playerOneQuestion - 1]].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.noOfCationSelectedOne = 0;
            self.noOfAnionSelectedOne = 0;
            
            self.correctAnionNumberSelectedOne = false;
            self.correctAnionSymbolSelectedOne = false;
            self.correctCationNumberSelectedOne = false;
            self.correctCationSymbolSelectedOne = false;
            
            if(self.playerTwoQuestion < self.playerOneQuestion){
                self.generateQuestion(self.playerOneQuestion)
            }
            
            self.displayQuestionOne(self.playerOneQuestion);
            
        }
        
    }
    
    func correctFormulaTwo(){
        
        playerTwoQuestion += 1;
        scoreLabelMeTwo.text = "Me: " + String(playerTwoQuestion)
        scoreLabelHimOne.text = "Them: " + String(playerTwoQuestion)
        
        if(playerTwoQuestion >= noOfQuestions){
            
            winTwo();
            
        }
        else{
                
            self.cationSymbolsTwo[self.correctCationSymbol[self.playerTwoQuestion - 1]].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            //self.cationNumbersTwo[self.correctCationNumber[self.playerTwoQuestion - 1]].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            self.anionSymbolsTwo[self.correctAnionSymbol[self.playerTwoQuestion - 1]].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            //self.anionNumbersTwo[self.correctAnionNumber[self.playerTwoQuestion - 1]].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.noOfCationSelectedTwo = 0;
            self.noOfAnionSelectedTwo = 0;
            
            self.correctAnionNumberSelectedTwo = false;
            self.correctAnionSymbolSelectedTwo = false;
            self.correctCationNumberSelectedTwo = false;
            self.correctCationSymbolSelectedTwo = false;
            
            if(self.playerTwoQuestion > self.playerOneQuestion){
                self.generateQuestion(self.playerTwoQuestion)
            }
            
            self.displayQuestionTwo(self.playerTwoQuestion);
            
        }
        
    }
    
    func wrongOne(){
        
        playing = false;
        cationSymbolsOne[correctCationSymbol[playerOneQuestion]].color = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
        anionSymbolsOne[correctAnionSymbol[playerOneQuestion]].color = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
        winTwo();
        
    }
    
    func wrongTwo(){
        
        playing = false;
        cationSymbolsTwo[correctCationSymbol[playerTwoQuestion]].color = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
        anionSymbolsTwo[correctAnionSymbol[playerTwoQuestion]].color = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
        winOne();
        
    }
    
    func winOne(){
        
        playing = false;
        
        self.runAction(SKAction.playSoundFileNamed("level_up.wav", waitForCompletion: false))
        
        questionLabelOne.runAction(SKAction.scaleBy(0.1, duration: 0))
        questionLabelOne.text = "You win"
        questionLabelOne.runAction(SKAction.scaleBy(10, duration: 0.5))
        
        questionLabelTwo.runAction(SKAction.scaleBy(0.1, duration: 0))
        questionLabelTwo.text = "You lose"
        questionLabelTwo.runAction(SKAction.scaleBy(10, duration: 0.5))
        
    }
    
    func winTwo(){
        
        playing = false;
        
        self.runAction(SKAction.playSoundFileNamed("level_up.wav", waitForCompletion: false))
        
        questionLabelTwo.runAction(SKAction.scaleBy(0.1, duration: 0))
        questionLabelTwo.text = "You win"
        questionLabelTwo.runAction(SKAction.scaleBy(10, duration: 0.5))
        
        questionLabelOne.runAction(SKAction.scaleBy(0.1, duration: 0))
        questionLabelOne.text = "You lose"
        questionLabelOne.runAction(SKAction.scaleBy(10, duration: 0.5))
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        if(correctCationSymbolSelectedOne && correctCationNumberSelectedOne && correctAnionSymbolSelectedOne && correctAnionNumberSelectedOne && playing){
            
            self.correctAnionNumberSelectedOne = false;
            self.correctAnionSymbolSelectedOne = false;
            self.correctCationNumberSelectedOne = false;
            self.correctCationSymbolSelectedOne = false;
            
            correctFormulaOne()
        }
        
        if(correctCationSymbolSelectedTwo && correctCationNumberSelectedTwo && correctAnionSymbolSelectedTwo && correctAnionNumberSelectedTwo && playing){
            
            self.correctAnionNumberSelectedTwo = false;
            self.correctAnionSymbolSelectedTwo = false;
            self.correctCationNumberSelectedTwo = false;
            self.correctCationSymbolSelectedTwo = false;
            
            correctFormulaTwo()
        }
        
    }
    
}
