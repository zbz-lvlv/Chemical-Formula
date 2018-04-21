import Foundation
import SpriteKit
import AudioToolbox

class NoMistakes: SKScene {
    
    var title = SKSpriteNode();
    var titleLabel = SKLabelNode();
    
    var backButton = SKSpriteNode();
    var backText = SKLabelNode();
    
    var restartButton = SKSpriteNode();
    var restartText = SKLabelNode();
    
    var cationSymbols = [SKSpriteNode]();
    var anionSymbols = [SKSpriteNode]();
    
    var cationSymbolsText = [SKLabelNode]();
    var anionSymbolsText = [SKLabelNode]();
    
    var answerSprite = SKSpriteNode();
    var questionSprite = SKSpriteNode();
    
    var answerLabel = SKLabelNode();
    var questionLabel = SKLabelNode();
    
    var scoreSprite = SKSpriteNode();
    var scoreLabel = SKLabelNode();
    var highscore = SKLabelNode();
    var formulaeFormed = SKLabelNode();
    
    var ionsObj = Ions();
    var ionToolsObj = IonTools();
    let fileObj = File();
    
    var noOfCationInList = 0;
    var noOfAnionInList = 0;
    
    var cationName = "";
    var anionName = "";
    
    var cationSeq = 0;
    var cationGrp = 0;
    var anionSeq = 0;
    var anionGrp = 0;
    
    var cationSymbol = "";
    var noOfCation = 0;
    var anionSymbol = "";
    var noOfAnion = 0;
    
    var cationSymbolSelected = "";
    var cationNumberSelected = "";
    var anionSymbolSelected = "";
    var anionNumberSelected = "";
    
    var noOfCationSelected = 0;
    var noOfAnionSelected = 0;
    
    var correctCationSymbol = 0;
    var correctCationNumber = 0;
    var correctAnionSymbol = 0;
    var correctAnionNumber = 0;
    
    var correctCationSymbolSelected = false;
    var correctCationNumberSelected = false;
    var correctAnionSymbolSelected = false;
    var correctAnionNumberSelected = false;
    
    var score = 0;
    
    var playing = true;
    
    var backPressedOnce: Bool = false;
    var restartPressedOnce: Bool = false;
    
    var screenHeight: CGFloat = 0.0;
    
    override func didMoveToView(view: SKView) {
        
        screenHeight = self.view!.frame.size.height;
        
        self.backgroundColor = UIColor(red: 0.8, green: 0.4, blue: 0, alpha: 1)
        
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
        
        backButton.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 8 - 1)
        backButton.position = CGPointMake(self.view!.frame.size.width / 4, 2 * screenHeight / 32)
        backButton.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        self.addChild(backButton)
        
        restartText.text = "New Game"
        restartText.fontSize = 20;
        restartText.fontName = "Chalkboard SE"
        restartText.fontColor = self.backgroundColor;
        restartText.horizontalAlignmentMode = .Center
        restartText.verticalAlignmentMode = .Center
        restartButton.addChild(restartText)
        
        restartButton.size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 8 - 1)
        restartButton.position = CGPointMake(3 * self.view!.frame.size.width / 4, 2 * screenHeight / 32)
        restartButton.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        self.addChild(restartButton)
        
        //initialize options
        for(var c = 0; c < 4; c++){
            cationSymbols.append(SKSpriteNode());
            
            cationSymbolsText.append(SKLabelNode())
            cationSymbolsText[c].fontSize = 20;
            cationSymbolsText[c].fontName = "Chalkboard SE"
            cationSymbolsText[c].fontColor = self.backgroundColor;
            cationSymbolsText[c].horizontalAlignmentMode = .Center
            cationSymbolsText[c].verticalAlignmentMode = .Center
            
            cationSymbols[c].addChild(cationSymbolsText[c])
            
            cationSymbols[c].size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 8 - 1)
            cationSymbols[c].position = CGPointMake(CGRectGetMidX(self.frame) - 1 * self.view!.frame.size.width / 4, (6 + 4 * CGFloat(c)) * screenHeight / 32)
            cationSymbols[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(cationSymbols[c])
        }
        
        for(var c = 0; c < 4; c++){
            anionSymbols.append(SKSpriteNode());
            
            anionSymbolsText.append(SKLabelNode())
            anionSymbolsText[c].fontSize = 20;
            anionSymbolsText[c].fontName = "Chalkboard SE"
            anionSymbolsText[c].fontColor = self.backgroundColor;
            anionSymbolsText[c].horizontalAlignmentMode = .Center
            anionSymbolsText[c].verticalAlignmentMode = .Center
            
            anionSymbols[c].addChild(anionSymbolsText[c])
            
            anionSymbols[c].size = CGSizeMake(self.view!.frame.size.width / 2 - 1, screenHeight / 8 - 1)
            anionSymbols[c].position = CGPointMake(CGRectGetMidX(self.frame) + 1 * self.view!.frame.size.width / 4, (6 + 4 * CGFloat(c)) * screenHeight / 32)
            anionSymbols[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.addChild(anionSymbols[c])
        }
        
        //initialize answer display
        answerLabel.fontSize = 25;
        answerLabel.fontName = "Chalkboard SE"
        answerLabel.fontColor = self.backgroundColor;
        answerLabel.horizontalAlignmentMode = .Center
        answerLabel.verticalAlignmentMode = .Center
        
        answerSprite.addChild(answerLabel)
        
        answerSprite.size = CGSizeMake((self.view?.frame.size.width)! - 1, 2 * screenHeight / 16 - 1)
        answerSprite.position = CGPointMake(self.view!.frame.size.width / 2, 22 * screenHeight / 32)
        answerSprite.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(answerSprite)
        
        //initialize quesiton display
        questionLabel.fontSize = 25;
        questionLabel.fontName = "Chalkboard SE"
        questionLabel.fontColor = self.backgroundColor;
        questionLabel.horizontalAlignmentMode = .Center
        questionLabel.verticalAlignmentMode = .Center
        
        questionSprite.addChild(questionLabel)
        
        questionSprite.size = CGSizeMake((self.view?.frame.size.width)! - 1, 2 * screenHeight / 16 - 1)
        questionSprite.position = CGPointMake(self.view!.frame.size.width / 2, 26 * screenHeight / 32)
        questionSprite.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(questionSprite)
        
        //initialize score
        scoreLabel.fontSize = 25;
        scoreLabel.fontName = "Chalkboard SE"
        scoreLabel.fontColor = self.backgroundColor;
        scoreLabel.text = "0"
        scoreLabel.horizontalAlignmentMode = .Center
        scoreLabel.verticalAlignmentMode = .Center
        
        scoreSprite.addChild(scoreLabel)
        
        highscore.fontSize = 12;
        highscore.fontName = "Chalkboard SE"
        highscore.fontColor = self.backgroundColor;
        highscore.text = "Highscore: " + String(Settings.highScoreNoMistakes)
        highscore.horizontalAlignmentMode = .Left
        highscore.verticalAlignmentMode = .Top
        highscore.position = CGPointMake(-(self.view!.frame.size.width / 2), screenHeight / 16)
        
        scoreSprite.addChild(highscore)
        
        formulaeFormed.fontSize = 12;
        formulaeFormed.fontName = "Chalkboard SE"
        formulaeFormed.fontColor = self.backgroundColor;
        formulaeFormed.text = "Formulae formed: " + String(Settings.qnCompleted);
        formulaeFormed.horizontalAlignmentMode = .Right
        formulaeFormed.verticalAlignmentMode = .Top
        formulaeFormed.position = CGPointMake(self.view!.frame.size.width / 2, screenHeight / 16)
        
        scoreSprite.addChild(formulaeFormed)
        
        scoreSprite.size = CGSizeMake((self.view?.frame.size.width)! - 1, 2 * screenHeight / 16 - 1)
        scoreSprite.position = CGPointMake(self.view!.frame.size.width / 2, 30 * screenHeight / 32)
        scoreSprite.color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        self.addChild(scoreSprite)
        
        //first run
        createQuestion()
        displayQuestion()
        solveQuestion()
        randomizeCorrectAnswer()
        displayCorrectAnswerOptions()
        displayOtherOptions()
        
    }
    
    func createQuestion(){
        
        var fail = true;
        
        while(fail){
            
            cationSeq = Int(arc4random_uniform(Settings.noOfCationSeq[Settings.difficulty]));
            cationGrp = Int(arc4random_uniform(Settings.noOfCationGrp[Settings.difficulty]));
            
            cationName = ionsObj.getCationName(cationSeq, group: cationGrp);
            cationSymbol = ionsObj.getCationSymbol(cationSeq, group: cationGrp);
            
            anionSeq = Int(arc4random_uniform(Settings.noOfAnionSeq[Settings.difficulty]));
            anionGrp = Int(arc4random_uniform(Settings.noOfAnionGrp[Settings.difficulty]));
            
            anionName = ionsObj.getAnionName(anionSeq, group: anionGrp);
            anionSymbol = ionsObj.getAnionSymbol(anionSeq, group: anionGrp);
            
            if(cationName != "" && anionName != "" && !ionToolsObj.getException(cationSymbol, anion: anionSymbol)){
                fail = false;
            }
            
        }
        
    }
    
    func displayQuestion(){
        questionLabel.text = cationName + " " + anionName
    }
    
    func solveQuestion(){
        noOfCation = anionGrp + 1;
        noOfAnion = cationGrp + 1;
        
        if(noOfAnion == noOfCation){
            noOfAnion = 1;
            noOfCation = 1;
        }
            
        else if (ionToolsObj.getHCF(noOfCation, noOfAnion: noOfAnion) > 1)
        {
            let hcf = ionToolsObj.getHCF(noOfCation, noOfAnion: noOfAnion);
            noOfCation /= hcf
            noOfAnion /= hcf
        }
    }
    
    func randomizeCorrectAnswer(){
        
        correctCationSymbol = Int(arc4random_uniform(4));
        correctCationNumber = Int(arc4random_uniform(4));
        correctAnionSymbol = Int(arc4random_uniform(4));
        correctAnionNumber = Int(arc4random_uniform(4));
        
    }
    
    func displayCorrectAnswerOptions(){
        
        cationSymbolsText[correctCationSymbol].text = cationSymbol + ionToolsObj.addCharge(cationGrp + 1, positive: 1)
        anionSymbolsText[correctAnionSymbol].text = anionSymbol + ionToolsObj.addCharge(anionGrp + 1, positive: 0)
        
    }
    
    func displayOtherOptions(){
        
        var cationSymbols = ["","","",""];
        var anionSymbols = ["","","",""];
        
        for(var c = 0; c < 4; c += 1){
            if(c != correctCationSymbol){
                
                var cationSymbolSeq = Int(arc4random_uniform(Settings.noOfCationSeq[Settings.difficulty]));
                var cationSymbolGrp = Int(arc4random_uniform(Settings.noOfCationGrp[Settings.difficulty]));
                cationSymbols[c] = ionsObj.getCationSymbol(cationSymbolSeq, group: cationSymbolGrp)
                
                while(cationSymbols[c] == "" || cationSymbols[c] == cationSymbol || ionToolsObj.getRepeated(cationSymbols[0], s1: cationSymbols[1], s2: cationSymbols[2], s3: cationSymbols[3], c: c)){
                    
                    cationSymbolSeq = Int(arc4random_uniform(Settings.noOfCationSeq[Settings.difficulty]));
                    cationSymbolGrp = Int(arc4random_uniform(Settings.noOfCationGrp[Settings.difficulty]));
                    cationSymbols[c] = ionsObj.getCationSymbol(cationSymbolSeq, group: cationSymbolGrp);
                    
                }
                
                cationSymbolsText[c].text = ionsObj.getCationSymbol(cationSymbolSeq, group: cationSymbolGrp) + ionToolsObj.addCharge(cationSymbolGrp + 1, positive: 1)
                
            }
            
            if(c != correctAnionSymbol){
                
                var anionSymbolSeq = Int(arc4random_uniform(Settings.noOfAnionSeq[Settings.difficulty]));
                var anionSymbolGrp = Int(arc4random_uniform(Settings.noOfAnionGrp[Settings.difficulty]));
                anionSymbols[c] = ionsObj.getAnionSymbol(anionSymbolSeq, group: anionSymbolGrp)
                
                while(ionsObj.getAnionSymbol(anionSymbolSeq, group: anionSymbolGrp) == "" || ionsObj.getAnionSymbol(anionSymbolSeq, group: anionSymbolGrp) == anionSymbol || ionToolsObj.getRepeated(anionSymbols[0], s1: anionSymbols[1], s2: anionSymbols[2], s3: anionSymbols[3], c: c)){
                    
                    anionSymbolSeq = Int(arc4random_uniform(Settings.noOfAnionSeq[Settings.difficulty]));
                    anionSymbolGrp = Int(arc4random_uniform(Settings.noOfAnionGrp[Settings.difficulty]));
                    anionSymbols[c] = ionsObj.getAnionSymbol(anionSymbolSeq, group: anionSymbolGrp)
                    
                }
                
                anionSymbolsText[c].text = ionsObj.getAnionSymbol(anionSymbolSeq, group: anionSymbolGrp) + ionToolsObj.addCharge(anionSymbolGrp + 1, positive: 0)
                
            }
            
        }
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches{
            
            let location = touch.locationInNode(self)
            
            print(location);
            print(nodeAtPoint(location))
            
            if(nodeAtPoint(location) == backButton || nodeAtPoint(location) == backText){
                
                self.runAction(SKAction.playSoundFileNamed("button_click.wav", waitForCompletion: false))
                
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
                    
                    let onePlayerScene = OnePlayer(size: self.size)
                    let transition = SKTransition.flipVerticalWithDuration(0.5)
                    onePlayerScene.scaleMode = SKSceneScaleMode.ResizeFill
                    self.scene!.view?.presentScene(onePlayerScene, transition: transition)
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
                    
                    restartText.text = "New Game"
                    restartPressedOnce = false;
                    
                    playing = true;
                    
                    score = 0;
                    scoreLabel.text = String(score);
                    
                    for(var c = 0; c < 4; c++){
                        cationSymbols[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
                        anionSymbols[c].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
                    }
                    
                    self.answerLabel.text = "";
                    
                    self.cationSymbolSelected = ""
                    self.cationNumberSelected = "";
                    self.anionSymbolSelected = ""
                    self.anionNumberSelected = "";
                    
                    self.noOfCationSelected = 0;
                    self.noOfAnionSelected = 0;
                    
                    self.correctAnionNumberSelected = false;
                    self.correctAnionSymbolSelected = false;
                    self.correctCationNumberSelected = false;
                    self.correctCationSymbolSelected = false;
                    
                    self.nextQuestion()
                    
                }
                
            }
            
            if(playing == true){
                
                if(nodeAtPoint(location) == cationSymbols[correctCationSymbol] || nodeAtPoint(location) == cationSymbolsText[correctCationSymbol]){
                    
                    cationSymbolSelected = cationSymbol;
                    if(ionToolsObj.getNoOfCapitalLetters(cationSymbol) > 1 && noOfCation > 1){
                        cationSymbolSelected = "(" + cationSymbolSelected + ")"
                    }
                    correctCationSymbolSelected = true;
                    
                    noOfCationSelected += 1;
                    if(noOfCationSelected <= noOfCation){
                        correctSelection(cationSymbols[correctCationSymbol])
                    }
                    if(noOfCationSelected == noOfCation){
                        correctCationNumberSelected = true
                    }
                    else if(noOfCationSelected > noOfCation){
                        wrong();
                    }
                    
                }
                    
                else if(nodeAtPoint(location) == anionSymbols[correctAnionSymbol] || nodeAtPoint(location) == anionSymbolsText[correctAnionSymbol]){
                    
                    anionSymbolSelected = anionSymbol
                    if(ionToolsObj.getNoOfCapitalLetters(anionSymbol) > 1 && noOfAnion > 1){
                        anionSymbolSelected = "(" + anionSymbolSelected + ")"
                    }
                    
                    correctSelection(anionSymbols[correctAnionSymbol])
                    correctAnionSymbolSelected = true;
                    
                    noOfAnionSelected += 1;
                    if(noOfAnionSelected <= noOfAnion){
                        correctSelection(anionSymbols[correctAnionSymbol])
                    }
                    if(noOfAnionSelected == noOfAnion){
                        correctAnionNumberSelected = true
                    }
                    else if(noOfAnionSelected > noOfAnion){
                        wrong();
                    }
                    
                }
                
                if(location.y > screenHeight / 8 && location.y < 5 * screenHeight / 8){
                    
                    if(nodeAtPoint(location) != cationSymbols[correctCationSymbol] && nodeAtPoint(location) != cationSymbolsText[correctCationSymbol] && nodeAtPoint(location) != anionSymbols[correctAnionSymbol] && nodeAtPoint(location) != anionSymbolsText[correctAnionSymbol]){
                        wrong();
                    }
                    
                }
                
            }
            
        }
        
    }
    
    func correctSelection(var spriteNode: SKSpriteNode){
        self.runAction(SKAction.playSoundFileNamed("correct_selection.wav", waitForCompletion: false))
        spriteNode.color = UIColor(red: 0.8, green: 1, blue: 0.8, alpha: 1)
        answerLabel.text = cationSymbolSelected + ionToolsObj.getSubscriptNumber(noOfCationSelected) + anionSymbolSelected + ionToolsObj.getSubscriptNumber(noOfAnionSelected)
    }
    
    func correctFormula(){
        
        playing = false;
        
        score += 1;
        scoreLabel.text = String(score)
        
        if(score > Settings.highScoreNoMistakes){
            Settings.highScoreNoMistakes = score
        }
        highscore.text = "Highscore: " + String(Settings.highScoreNoMistakes)
        
        Settings.qnCompleted += 1;
        formulaeFormed.text = "Formulae formed: " + String(Settings.qnCompleted);
        
        fileObj.write()
        
        let wait = SKAction.waitForDuration(0.2)
        let run = SKAction.runBlock {
            
            self.cationSymbols[self.correctCationSymbol].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            self.anionSymbols[self.correctAnionSymbol].color = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
            
            self.answerLabel.text = "";
            
            self.cationSymbolSelected = ""
            self.cationNumberSelected = "";
            self.anionSymbolSelected = ""
            self.anionNumberSelected = "";
            
            self.noOfCationSelected = 0;
            self.noOfAnionSelected = 0;
            
            self.correctAnionNumberSelected = false;
            self.correctAnionSymbolSelected = false;
            self.correctCationNumberSelected = false;
            self.correctCationSymbolSelected = false;
            
            self.nextQuestion()
        }
        self.runAction(SKAction.sequence([wait, run]))
        
        
    }
    
    func nextQuestion(){
        playing = true;
        
        createQuestion()
        displayQuestion()
        solveQuestion()
        randomizeCorrectAnswer()
        displayCorrectAnswerOptions()
        displayOtherOptions()
    }
    
    func wrong(){
        
        self.runAction(SKAction.playSoundFileNamed("wrong.wav", waitForCompletion: false))
        
        self.correctAnionNumberSelected = false;
        self.correctAnionSymbolSelected = false;
        self.correctCationNumberSelected = false;
        self.correctCationSymbolSelected = false;
        
        playing = false;
        
        //show correct answer
        self.cationSymbols[self.correctCationSymbol].color = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
        self.anionSymbols[self.correctAnionSymbol].color = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
        
        if(ionToolsObj.getNoOfCapitalLetters(cationSymbol) > 1 && noOfCation > 1){
            cationSymbol = "(" + cationSymbol + ")"
        }
        if(ionToolsObj.getNoOfCapitalLetters(anionSymbol) > 1 && noOfAnion > 1){
            anionSymbol = "(" + anionSymbol + ")"
        }
        
        self.answerLabel.text = cationSymbol + ionToolsObj.getSubscriptNumber(noOfCation) + anionSymbol + ionToolsObj.getSubscriptNumber(noOfAnion)
        
        //vibrate
        SKAction.runBlock(){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        if(correctCationSymbolSelected && correctCationNumberSelected && correctAnionSymbolSelected && correctAnionNumberSelected){
            
            self.correctAnionNumberSelected = false;
            self.correctAnionSymbolSelected = false;
            self.correctCationNumberSelected = false;
            self.correctCationSymbolSelected = false;
            
            correctFormula()
        }
    }
    
}
