import SwiftUI

class EgyptGameViewModel: ObservableObject {
    let contact = EgyptGameModel()

    func createEgyptGrabGameScene(gameData: EgyptGameData, level: Int) -> EgyptGameSpriteKit {
        let scene = EgyptGameSpriteKit(level: level)
        scene.game  = gameData
        return scene
    }
}
