import SwiftUI

struct EgyptPauseView: View {
    @StateObject var egyptPauseModel =  EgyptPauseViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router: Router
    let game: EgyptGameData
    let level: Int
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.mainBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.pauseLabel)
                        .resizable()
                        .frame(width: geometry.size.width * 0.45,
                               height: geometry.size.height * 0.18)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 9)
                    
                    Image(.figure)
                        .resizable()
                        .frame(width: geometry.size.width * 0.201,
                               height: geometry.size.height * 0.635)
                        .offset(x: geometry.size.width * -0.395, y: geometry.size.height * 0.239)
                    
                    Image(.figure)
                        .resizable()
                        .frame(width: geometry.size.width * 0.201,
                               height: geometry.size.height * 0.635)
                        .offset(x: geometry.size.width * 0.39,
                                y: geometry.size.height * 0.239)
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Image(.settingsBack)
                                .resizable()
                                .frame(width: geometry.size.width * 0.322,
                                       height: geometry.size.height * 0.393)
                            
                            
                            VStack {
                                Text("GAME ON PAUSE")
                                    .TLHeader(size: 35)
                                    .frame(width: geometry.size.width * 0.195,
                                           height: geometry.size.height * 0.325)
                                    .multilineTextAlignment(.center)
                                    .minimumScaleFactor(0.8)
                            }
                            HStack(spacing: 50) {
                                StoneButton(foregroundImage: EgyptImageName.retry.rawValue,
                                            sizeForegroundImage: 31,
                                            sizeXBackground: 77,
                                            sizeYBackground: 56) {
                                    router.showGame(level: level)
                                }
                                
                                StoneButton(foregroundImage: EgyptImageName.resumeArrow.rawValue,
                                            sizeForegroundImage: 31,
                                            sizeXBackground: 77,
                                            sizeYBackground: 56) {
                                    game.isPause = false
                                }
                            }
                            .padding(.top, geometry.size.height * 0.444)
                        }
                        
                        HStack(spacing: 15) {
                            StoneButton(foregroundImage: EgyptImageName.shop.rawValue,
                                        sizeForegroundImage: 26,
                                        sizeXBackground: 65,
                                        sizeYBackground: 47) {
                                router.showShop()
                            }
                            
                            StoneButton(foregroundImage: EgyptImageName.home.rawValue,
                                        sizeForegroundImage: 26,
                                        sizeXBackground: 65,
                                        sizeYBackground: 47) {
                                router.showMenu()
                            }
                                        .offset(y: 25)
                            
                            StoneButton(foregroundImage: EgyptImageName.gear.rawValue,
                                        sizeForegroundImage: 26,
                                        sizeXBackground: 65,
                                        sizeYBackground: 47) {
                                router.showSettings()
                            }
                        }
                        .offset(y: -25)
                        .padding(.top, 30)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    let game = EgyptGameData()
    let level = 1
    return EgyptPauseView(router: router, game: game, level: level)
}

