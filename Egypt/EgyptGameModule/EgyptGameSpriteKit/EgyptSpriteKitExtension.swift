import SwiftUI
import SpriteKit

extension EgyptGameSpriteKit {
    func createMainObject() {
        let gameBackground = SKSpriteNode(texture: SKTexture(imageNamed: UserDefaultsManager.shared.getPurchasedImages().randomElement()!))
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        
        let fieldForGame = SKSpriteNode(imageNamed: EgyptImageName.fieldForGame.rawValue)
        fieldForGame.size = CGSize(width: size.width * 0.4215,
                                   height: size.height * 0.611)
        fieldForGame.position = CGPoint(x: size.width / 2, y: size.height / 1.9)
        addChild(fieldForGame)
        
        let backForBlock = SKSpriteNode(imageNamed: EgyptImageName.backForBlock.rawValue)
        backForBlock.size = CGSize(width: size.width * 0.131,
                                   height: size.height * 0.186)
        backForBlock.position = CGPoint(x: size.width / 2, y: size.height / 9)
        addChild(backForBlock)
    }
    
    func createRightButtons() {
        let backForShop = SKSpriteNode(imageNamed: EgyptImageName.rectangleStoneBackgroundButton.rawValue)
        backForShop.name = "backForShop"
        backForShop.size = CGSize(width: size.width * 0.0963,
                                  height: size.height * 0.155)
        backForShop.position = CGPoint(x: size.width / 1.14, y: size.height / 1.33)
        addChild(backForShop)
        
        let shop = SKSpriteNode(imageNamed: EgyptImageName.shop.rawValue)
        shop.name = "shop"
        shop.size = CGSize(width: size.width * 0.039,
                           height: size.height * 0.084)
        shop.position = CGPoint(x: size.width / 1.14, y: size.height / 1.33)
        addChild(shop)
        
        let backForTimeBonus = SKSpriteNode(imageNamed: EgyptImageName.rectangleStoneBackgroundButton.rawValue)
        backForTimeBonus.name = "backForTimeBonus"
        backForTimeBonus.size = CGSize(width: size.width * 0.0963,
                                       height: size.height * 0.155)
        backForTimeBonus.position = CGPoint(x: size.width / 1.14, y: size.height / 1.96)
        addChild(backForTimeBonus)
        
        let timeBonus = SKSpriteNode(imageNamed: EgyptImageName.timeBonus.rawValue)
        timeBonus.name = "timeBonus"
        timeBonus.size = CGSize(width: size.width * 0.039,
                                height: size.height * 0.084)
        timeBonus.position = CGPoint(x: size.width / 1.14, y: size.height / 1.96)
        addChild(timeBonus)
        
        let timeBonusCountBack = SKSpriteNode(imageNamed: EgyptImageName.backForTimeBonusCount.rawValue)
        timeBonusCountBack.name = "timeBonusCountBack"
        timeBonusCountBack.size = CGSize(width: size.width * 0.033,
                                         height: size.height * 0.044)
        timeBonusCountBack.position = CGPoint(x: size.width / 1.1, y: size.height / 2.19)
        addChild(timeBonusCountBack)
        
        timeBonusCount = SKLabelNode(fontNamed: "TLheader-Regular")
        timeBonusCount.text = "\(game!.timeBonusCount)"
        timeBonusCount.fontSize = size.width * 0.016
        timeBonusCount.fontColor = UIColor(red: 109/255, green: 75/255, blue: 9/255, alpha: 1)
        timeBonusCount.position = CGPoint(x: size.width / 1.1, y: size.height / 2.255)
        addChild(timeBonusCount)
        
        let backForPause = SKSpriteNode(imageNamed: EgyptImageName.rectangleStoneBackgroundButton.rawValue)
        backForPause.name = "backForPause"
        backForPause.size = CGSize(width: size.width * 0.0963,
                                   height: size.height * 0.155)
        backForPause.position = CGPoint(x: size.width / 1.14, y: size.height / 3.4)
        addChild(backForPause)
        
        let pause = SKSpriteNode(imageNamed: EgyptImageName.pause.rawValue)
        pause.name = "pause"
        pause.size = CGSize(width: size.width * 0.039,
                            height: size.height * 0.084)
        pause.position = CGPoint(x: size.width / 1.14, y: size.height / 3.4)
        addChild(pause)
    }
    
    func createLeftButtons() {
        let backForCoin = SKSpriteNode(imageNamed: EgyptImageName.backForTime.rawValue)
        backForCoin.size = CGSize(width: size.width * 0.131,
                                  height: size.height * 0.199)
        backForCoin.position = CGPoint(x: size.width / 8, y: size.height / 1.3)
        addChild(backForCoin)
        
        if game!.moneyCount <= 99 {
            let moneyLabel = SKLabelNode(fontNamed: "TLheader-Regular")
            moneyLabel.text = "\(game!.moneyCount)"
            moneyLabel.fontSize = size.width * 0.048
            moneyLabel.fontColor = UIColor(red: 109/255, green: 75/255, blue: 9/255, alpha: 1)
            moneyLabel.position = CGPoint(x: size.width / 9.8, y: size.height / 1.365)
            addChild(moneyLabel)
        } else {
            let moneyLabel = SKLabelNode(fontNamed: "TLheader-Regular")
            moneyLabel.text = "\(game!.moneyCount)"
            moneyLabel.fontSize = size.width * 0.038
            moneyLabel.fontColor = UIColor(red: 109/255, green: 75/255, blue: 9/255, alpha: 1)
            moneyLabel.position = CGPoint(x: size.width / 9.8, y: size.height / 1.355)
            addChild(moneyLabel)
        }
      
        
        let coin = SKSpriteNode(imageNamed: EgyptImageName.coin.rawValue)
        coin.size = CGSize(width: size.width * 0.042,
                           height: size.height * 0.088)
        coin.position = CGPoint(x: size.width / 6.5, y: size.height / 1.3)
        addChild(coin)
        
        let backForTries = SKSpriteNode(imageNamed: EgyptImageName.backForTime.rawValue)
        backForTries.size = CGSize(width: size.width * 0.131,
                                   height: size.height * 0.199)
        backForTries.position = CGPoint(x: size.width / 8, y: size.height / 1.87)
        addChild(backForTries)
        
        let tries = SKSpriteNode(imageNamed: EgyptImageName.tries.rawValue)
        tries.size = CGSize(width: size.width * 0.046,
                            height: size.height * 0.1)
        tries.position = CGPoint(x: size.width / 9.8, y: size.height / 1.87)
        addChild(tries)
        
        tryLabel = SKLabelNode(fontNamed: "TLheader-Regular")
        tryLabel.text = "\(game!.triesLeft)"
        tryLabel.fontSize = size.width * 0.048
        tryLabel.fontColor = UIColor(red: 109/255, green: 75/255, blue: 9/255, alpha: 1)
        tryLabel.position = CGPoint(x: size.width / 6.8, y: size.height / 2)
        addChild(tryLabel)
        
        let backForTime = SKSpriteNode(imageNamed: EgyptImageName.backForTime.rawValue)
        backForTime.size = CGSize(width: size.width * 0.131,
                                  height: size.height * 0.199)
        backForTime.position = CGPoint(x: size.width / 8, y: size.height / 3.3)
        addChild(backForTime)
        
        let timeLeftImage = SKSpriteNode(imageNamed: EgyptImageName.time.rawValue)
        timeLeftImage.size = CGSize(width: size.width * 0.046,
                                    height: size.height * 0.1)
        timeLeftImage.position = CGPoint(x: size.width / 10.5, y: size.height / 3.3)
        addChild(timeLeftImage)
        
        timeLeft = SKLabelNode(fontNamed: "TLheader-Regular")
        timeLeft.text = ":\(game!.timeLeft % 60)"
        timeLeft.fontSize = size.width * 0.048
        timeLeft.fontColor = UIColor(red: 109/255, green: 75/255, blue: 9/255, alpha: 1)
        timeLeft.position = CGPoint(x: size.width / 6.95, y: size.height / 3.75)
        addChild(timeLeft)
    }
    
    func createHLine() {
        if level <= 3 {
            let numberOfLines = 4
            let spacing: CGFloat = size.height * 0.14
            for i in 0..<numberOfLines {
                let horizontalLine = SKSpriteNode(imageNamed: EgyptImageName.horizontalLine.rawValue)
                horizontalLine.size = CGSize(width: size.width * 0.303, height: 1)
                horizontalLine.position = CGPoint(x: size.width / 2,
                                                  y: size.height / 1.37 + (CGFloat(i) * (1 - spacing)))
                addChild(horizontalLine)
            }
        } else if level > 3 && level <= 7 {
            let numberOfLines = 4
            let spacing: CGFloat = 50
            for i in 0..<numberOfLines {
                let horizontalLine = SKSpriteNode(imageNamed: EgyptImageName.horizontalLine.rawValue)
                horizontalLine.size = CGSize(width: size.width * 0.303, height: 1)
                horizontalLine.position = CGPoint(x: size.width / 2,
                                                  y: size.height / 1.41 + (CGFloat(i) * (1 - spacing)))
                addChild(horizontalLine)
            }
        } else {
            let numberOfLines = 4
            let spacing: CGFloat = 40
            for i in 0..<numberOfLines {
                let horizontalLine = SKSpriteNode(imageNamed: EgyptImageName.horizontalLine.rawValue)
                horizontalLine.size = CGSize(width: size.width * 0.303, height: 1)
                horizontalLine.position = CGPoint(x: size.width / 2,
                                                  y: size.height / 1.5 + (CGFloat(i) * (1 - spacing)))
                addChild(horizontalLine)
            }
        }
    }
    
    func createVLine() {
        if level <= 3 {
            let numberOfLines = 5
            let spacing: CGFloat = size.width * 0.0769
            for i in 0..<numberOfLines {
                let vericalLine = SKSpriteNode(imageNamed: EgyptImageName.vericalLine.rawValue)
                vericalLine.size = CGSize(width: 1, height: size.height * 0.4125)
                vericalLine.position = CGPoint(x: size.width / 2.87  - (CGFloat(i) * (1 - spacing)),
                                               y: size.height / 1.91)
                addChild(vericalLine)
            }
        } else if level > 3 && level <= 7 {
            let numberOfLines = 6
            let spacing: CGFloat = 52.5
            for i in 0..<numberOfLines {
                let vericalLine = SKSpriteNode(imageNamed: EgyptImageName.vericalLine.rawValue)
                vericalLine.size = CGSize(width: 1, height: 147)
                vericalLine.position = CGPoint(x: size.width / 2.87  - (CGFloat(i) * (1 - spacing)),
                                               y: size.height / 1.91)
                addChild(vericalLine)
            }
        } else {
            let numberOfLines = 7
            let spacing: CGFloat = 44
            for i in 0..<numberOfLines {
                let vericalLine = SKSpriteNode(imageNamed: EgyptImageName.vericalLine.rawValue)
                vericalLine.size = CGSize(width: 1, height: 115)
                vericalLine.position = CGPoint(x: size.width / 2.865  - (CGFloat(i) * (1 - spacing)),
                                               y: size.height / 1.93)
                addChild(vericalLine)
            }
        }
    }
    
    func returnAllPositions() -> [(position: CGPoint, color: String)] {
        switch level {
        case 1:
            return [(CGPoint(x: size.width / 2.58, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 2.6), "blueBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 2.58, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 1.91), "yellowBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 1.91), "yellowBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 2.58, y: size.height / 1.52), "yellowBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 1.52), "yellowBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 1.52), "blueBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 1.52), "yellowBlock")]
        case 2:
            return [(CGPoint(x: size.width / 2.58, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 2.6), "blueBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 2.6), "blueBlock"),
                    (CGPoint(x: size.width / 2.58, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 1.91), "yellowBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 1.91), "yellowBlock"),
                    (CGPoint(x: size.width / 2.58, y: size.height / 1.52), "yellowBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 1.52), "blueBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 1.52), "yellowBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 1.52), "blueBlock")]
        case 3:
            return [(CGPoint(x: size.width / 2.58, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 2.6), "blueBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 2.58, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 1.91), "yellowBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 2.58, y: size.height / 1.52), "blueBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 1.52), "yellowBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 1.52), "blueBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 1.52), "blueBlock")]
        case 4:
            return [(CGPoint(x: size.width / 2.63, y: size.height / 2.51), "yellowBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 2.51), "yellowBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 2.51), "grayBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 2.51), "blueBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 2.51), "blueBlock"),
                    
                    (CGPoint(x: size.width / 2.63, y: size.height / 1.92), "yellowBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 1.92), "grayBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 1.92), "yellowBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 1.92), "grayBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 1.92), "yellowBlock"),
                    
                    (CGPoint(x: size.width / 2.63, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 1.55), "blueBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 1.55), "blueBlock")]
            
        case 5:
            return [(CGPoint(x: size.width / 2.63, y: size.height / 2.51), "grayBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 2.51), "yellowBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 2.51), "blueBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 2.51), "grayBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 2.51), "grayBlock"),
                    
                    (CGPoint(x: size.width / 2.63, y: size.height / 1.92), "blueBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 1.92), "blueBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 1.92), "yellowBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 1.92), "grayBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 1.92), "yellowBlock"),
                    
                    (CGPoint(x: size.width / 2.63, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 1.55), "blueBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 1.55), "blueBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 1.55), "grayBlock")]
            
        case 6:
            return [(CGPoint(x: size.width / 2.63, y: size.height / 2.51), "yellowBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 2.51), "blueBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 2.51), "blueBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 2.51), "grayBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 2.51), "grayBlock"),
                    
                    (CGPoint(x: size.width / 2.63, y: size.height / 1.92), "grayBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 1.92), "yellowBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 1.92), "yellowBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 1.92), "yellowBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 1.92), "blueBlock"),
                    
                    (CGPoint(x: size.width / 2.63, y: size.height / 1.55), "blueBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 1.55), "yellowBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 1.55), "blueBlock")]
            
        case 7:
            return [(CGPoint(x: size.width / 2.63, y: size.height / 2.51), "blueBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 2.51), "grayBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 2.51), "blueBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 2.51), "blueBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 2.51), "grayBlock"),
                    
                    (CGPoint(x: size.width / 2.63, y: size.height / 1.92), "grayBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 1.92), "yellowBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 1.92), "yellowBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 1.92), "grayBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 1.92), "yellowBlock"),
                    
                    (CGPoint(x: size.width / 2.63, y: size.height / 1.55), "yellowBlock"),
                    (CGPoint(x: size.width / 2.27, y: size.height / 1.55), "blueBlock"),
                    (CGPoint(x: size.width / 2, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 1.785, y: size.height / 1.55), "grayBlock"),
                    (CGPoint(x: size.width / 1.612, y: size.height / 1.55), "blueBlock")]
            
        case 8:
            return [(CGPoint(x: size.width / 2.665, y: size.height / 2.38), "blueBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 2.38), "lightBrownBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 2.38), "lightBrownBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 2.38), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 2.38), "lightBrownBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 2.38), "yellowBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.93), "yellowBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.93), "yellowBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.93), "yellowBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.93), "lightBrownBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.62), "yellowBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.62), "grayBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.62), "blueBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.62), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.62), "grayBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.62), "yellowBlock")]
            
        case 9:
            return [(CGPoint(x: size.width / 2.665, y: size.height / 2.38), "grayBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 2.38), "yellowBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 2.38), "grayBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 2.38), "lightBrownBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 2.38), "blueBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 2.38), "grayBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.93), "yellowBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.93), "lightBrownBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.93), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.93), "grayBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.93), "lightBrownBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.62), "blueBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.62), "blueBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.62), "lightBrownBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.62), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.62), "blueBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.62), "blueBlock")]
            
        case 10:
            return [(CGPoint(x: size.width / 2.665, y: size.height / 2.38), "grayBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 2.38), "yellowBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 2.38), "grayBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 2.38), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 2.38), "yellowBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 2.38), "yellowBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.93), "lightBrownBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.93), "grayBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.93), "lightBrownBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.62), "grayBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.62), "yellowBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.62), "lightBrownBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.62), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.62), "blueBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.62), "blueBlock")]
            
        case 11:
            return [(CGPoint(x: size.width / 2.665, y: size.height / 2.38), "grayBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 2.38), "lightBrownBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 2.38), "yellowBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 2.38), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 2.38), "lightBrownBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 2.38), "grayBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.93), "yellowBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.93), "grayBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.93), "yellowBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.62), "grayBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.62), "yellowBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.62), "lightBrownBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.62), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.62), "blueBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.62), "lightBrownBlock")]
            
        case 12:
            return [(CGPoint(x: size.width / 2.665, y: size.height / 2.38), "lightBrownBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 2.38), "blueBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 2.38), "yellowBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 2.38), "grayBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 2.38), "grayBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 2.38), "blueBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.93), "grayBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.93), "lightBrownBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.93), "grayBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.93), "yellowBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.93), "blueBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.93), "grayBlock"),
                    
                    (CGPoint(x: size.width / 2.665, y: size.height / 1.62), "lightBrownBlock"),
                    (CGPoint(x: size.width / 2.35, y: size.height / 1.62), "yellowBlock"),
                    (CGPoint(x: size.width / 2.105, y: size.height / 1.62), "blueBlock"),
                    (CGPoint(x: size.width / 1.905, y: size.height / 1.62), "grayBlock"),
                    (CGPoint(x: size.width / 1.735, y: size.height / 1.62), "grayBlock"),
                    (CGPoint(x: size.width / 1.598, y: size.height / 1.62), "yellowBlock")]
        default:
            return [(CGPoint(x: size.width / 2.58, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 2.6), "blueBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 2.6), "yellowBlock"),
                    (CGPoint(x: size.width / 2.58, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 1.91), "yellowBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 1.91), "yellowBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 1.91), "blueBlock"),
                    (CGPoint(x: size.width / 2.58, y: size.height / 1.52), "yellowBlock"),
                    (CGPoint(x: size.width / 2.165, y: size.height / 1.52), "yellowBlock"),
                    (CGPoint(x: size.width / 1.86, y: size.height / 1.52), "blueBlock"),
                    (CGPoint(x: size.width / 1.63, y: size.height / 1.52), "yellowBlock")]

        }
    }
    
    func createNewBlock() {
        if level <= 3 {
            let color = returnColor()
            block = SKSpriteNode(imageNamed: color)
            block?.size = CGSize(width: size.width * 0.06, height: size.height * 0.115)
            block?.name = color
            block?.position = CGPoint(x: size.width / 2, y: size.height / 8.8)
            addChild(block!)
        } else if level > 3 && level <= 7 {
            let color = returnColor()
            block = SKSpriteNode(imageNamed: color)
            block?.size = CGSize(width: size.width * 0.048, height: size.height * 0.095)
            block?.name = color
            block?.position = CGPoint(x: size.width / 2, y: size.height / 8.8)
            addChild(block!)
        } else {
            let color = returnColor()
            block = SKSpriteNode(imageNamed: color)
            block?.size = CGSize(width: size.width * 0.041, height: size.height * 0.081)
            block?.name = color
            block?.position = CGPoint(x: size.width / 2, y: size.height / 8.8)
            addChild(block!)
        }
    }
    
    func allPositionsOccupied() -> Bool {
        let allPositions = returnAllPositions().map { $0.position }
        for position in allPositions {
            if !occupiedPositions.contains(position) {
                return false
            }
        }
        return true
    }
    
    func returnAvailableColors() -> [String] {
        let freePositions = returnAllPositions().filter { positionData in
            !occupiedPositions.contains(positionData.position)
        }
        let availableColors = freePositions.map { $0.color }
        return Array(Set(availableColors))
    }
    
    func returnColor() -> String {
        let availableColors = returnAvailableColors()
        return availableColors.randomElement() ?? "yellowBlock"
    }
    
    func snapToClosestPosition(for block: SKSpriteNode) {
        var closestPositionData: (position: CGPoint, color: String)?
        var closestDistance = CGFloat.greatestFiniteMagnitude
        
        for positionData in returnAllPositions() {
            let position = positionData.position
            
            if !occupiedPositions.contains(position) {
                let distanceX = abs(position.x - block.position.x)
                let distanceY = abs(position.y - block.position.y)
                
                if distanceX <= 10 && distanceY <= 10 {
                    let distance = hypot(distanceX, distanceY)
                    if distance < closestDistance {
                        closestDistance = distance
                        closestPositionData = positionData
                    }
                }
            }
        }
        
        if let targetPositionData = closestPositionData {
            if block.name == targetPositionData.color {
                block.run(SKAction.move(to: targetPositionData.position, duration: 0.3)) { [weak self] in
                    self?.occupiedPositions.append(targetPositionData.position)
                    self?.block.name = "nil"
                    self?.block = nil
                    if self?.allPositionsOccupied() == true {
                        self?.game!.isWin = true
                        UserDefaultsManager.shared.completeLevel()
                        self?.timer!.invalidate()
                    } else {
                        self?.createNewBlock()
                    }
                }
            } else {
                minusTries()
            }
        } else {
            minusTries()
        }
    }
    
    func minusTries() {
        if game!.triesLeft > 0 {
            game!.triesLeft -= 1
            tryLabel.text = "\(game!.triesLeft)"
        }
        
        if game!.triesLeft == 0 {
            game!.isLose = true
        }
    }
    
    func moveNodeTo(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "yellowBlock" || tappedNode.name == "blueBlock" || tappedNode.name == "grayBlock" || tappedNode.name == "lightBrownBlock" {
            block.position = touchLocation
        }
    }
    
    func checkForRightPosition(touchLocation: CGPoint) {
        guard let currentBlock = block else { return }
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "yellowBlock" || tappedNode.name == "blueBlock" || tappedNode.name == "grayBlock" || tappedNode.name == "lightBrownBlock" {
            snapToClosestPosition(for: currentBlock)
        }
    }
}
