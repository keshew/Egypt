import SwiftUI
import SpriteKit

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

