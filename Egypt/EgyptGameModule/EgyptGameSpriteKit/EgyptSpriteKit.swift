import SwiftUI
import SpriteKit

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
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        setupView()
        createNewBlock()
        createNodes()
        startTimer()
    }
    
    override func willMove(from view: SKView) {
        timer?.invalidate()
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
