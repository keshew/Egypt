import SwiftUI
import SpriteKit

class EgyptGameData: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var isShop = false
    @Published var isPause = false
    @Published var isStartTimer = false
    @Published var timeLeft = 15
    @Published var triesLeft = 5
    @Published var moneyCount = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
    @Published var timeBonusCount = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfTimeBonus.rawValue) as? Int ?? 0
}

class EgyptGameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: EgyptGameData?
    let level: Int
    var block: SKSpriteNode!
    var tryLabel: SKLabelNode!
    var timeLeft: SKLabelNode!
    var timeBonusCount: SKLabelNode!
    var occupiedPositions: [CGPoint] = []
    var timer: Timer!
    
    init(level: Int) {
        self.level = level
        super.init(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        createMainObject()
        createHLine()
        createVLine()
        createRightButtons()
        createLeftButtons()
    }
    
    func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if self.game!.isPause == false, self.game?.isLose == false {
                    self.updateTimer()
                }
            }
            self.isUserInteractionEnabled = true
        }
    }
    
    func updateTimer() {
        guard !game!.isPause else { return }
        guard !game!.isPause else { return }
        if game!.isWin == false || game!.isPause == false || game!.isLose == false {
            if game?.timeLeft ?? 0 > 0 {
                game?.timeLeft -= 1
                timeLeft.text = ":\(game!.timeLeft % 60)"
            } else {
                timer?.invalidate()
                self.game!.isLose = true
            }
        }
    }
    
    func shopTapped(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "shop" || tappedNode.name == "backForShop" {
            game!.isShop = true
        }
    }
    
    func timeBonusTapped(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "timeBonus" || tappedNode.name == "backForTimeBonus" || tappedNode.name == "timeBonusCountBack" {
            if game!.timeBonusCount != 0 {
                game?.timeLeft += 5
                UserDefaultsManager.shared.defaults.set(game!.timeBonusCount - 1,  forKey: Keys.countOfTimeBonus.rawValue)
                game?.timeBonusCount -= 1
                timeBonusCount.text = "\(game!.timeBonusCount)"
            }
        }
    }
    
    func pauseTapped(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "backForPause" || tappedNode.name == "pause" {
            game!.isPause = true
        }
    }
    
    func createNodes() {
        guard !game!.isPause else { return }
        isUserInteractionEnabled = false
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        let scaleUp = SKAction.scale(to: 1.0, duration: 1)
        let scaleDown = SKAction.scale(to: 0.0, duration: 1)
        
        let rememberLabel = SKSpriteNode(imageNamed: EgyptImageName.rememberLabel.rawValue)
        rememberLabel.size = CGSize(width: 313, height: 65)
        rememberLabel.position = CGPoint(x: size.width / 2, y: size.height / 1.1)
        addChild(rememberLabel)
        
        let positions = returnAllPositions()
        for (position, color) in positions {
            
            let block = SKSpriteNode(imageNamed: color)
            
            if level <= 3 {
                block.size = CGSize(width: 44, height: 42)
                block.position = position
                block.alpha = 0
                block.setScale(0)
                addChild(block)
            } else if level > 3 && level <= 7 {
                block.size = CGSize(width: 35, height: 35)
                block.position = position
                block.alpha = 0
                block.setScale(0)
                addChild(block)
            } else {
                block.size = CGSize(width: 30, height: 30)
                block.position = position
                block.alpha = 0
                block.setScale(0)
                addChild(block)
            }
            
            block.run(SKAction.group([fadeIn, scaleUp]))
            block.run(SKAction.sequence([
                SKAction.wait(forDuration: 4),
                scaleDown,
                SKAction.removeFromParent()
                
                
            ])) {
                rememberLabel.run(scaleDown) {
                    rememberLabel.removeFromParent()
                }
                
                let levelLabel = SKLabelNode(fontNamed: "TLheader-Regular")
                levelLabel.text = "LEVEL \(self.level)"
                levelLabel.fontSize = self.size.width * 0.059
                levelLabel.setScale(0)
                levelLabel.fontColor = UIColor(red: 109/255, green: 75/255, blue: 9/255, alpha: 1)
                levelLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height / 1.14)
                self.addChild(levelLabel)
                levelLabel.run(scaleUp)
            }
        }
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        setupView()
        createNewBlock()
        createNodes()
        startTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            moveNodeTo(touchLocation: touchLocation)
            shopTapped(touchLocation: touchLocation)
            timeBonusTapped(touchLocation: touchLocation)
            pauseTapped(touchLocation: touchLocation)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            moveNodeTo(touchLocation: touchLocation)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            checkForRightPosition(touchLocation: touchLocation)
        }
    }
}

struct EgyptGameView: View {
    @StateObject var egyptGameModel =  EgyptGameViewModel()
    @StateObject var gameModel =  EgyptGameData()
    @ObservedObject var router: Router
    var level: Int
    var body: some View {
        ZStack {
            SpriteView(scene: egyptGameModel.createEgyptGrabGameScene(gameData: gameModel, level: level))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $gameModel.isWin) {
                    EgyptWinView(router: router)
                }
            
                .navigationDestination(isPresented: $gameModel.isLose) {
                    EgyptLoseView(router: router, level: level)
                }
            
                .navigationDestination(isPresented: $gameModel.isShop) {
                    EgyptShopView(router: router)
                }

            if gameModel.isPause {
                EgyptPauseView(router: router, game: gameModel, level: level)
            }
        }
    }
}

#Preview {
    let level = 1
    @ObservedObject var router = Router()
    return EgyptGameView(router: router, level: 1)
}

