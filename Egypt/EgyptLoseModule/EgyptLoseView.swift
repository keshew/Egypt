import SwiftUI

struct EgyptLoseView: View {
    @StateObject var egyptLoseModel =  EgyptLoseViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router: Router
    var level: Int
    
    var body: some View {
        GeometryReader { geometry   in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.loseBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.loseFigure)
                        .resizable()
                        .frame(width: geometry.size.width * 0.356,
                               height: geometry.size.height * 0.58)
                        .offset(x: geometry.size.width * 0.36,
                                y: geometry.size.height * 0.245)
                    
                    VStack {
                        Spacer()
                        ZStack {
                            Image(.settingsBack)
                                .resizable()
                                .frame(width: geometry.size.width * 0.322,
                                       height: geometry.size.height * 0.393)
                            
                            Text("YOU LOST. TRY ONCE MORE")
                                .TLHeader(size: 35)
                                .frame(width: 191, height: 112)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.8)
                            
                            
                            StoneButton(foregroundImage: EgyptImageName.retry.rawValue,
                                        sizeForegroundImage: 31,
                                        sizeXBackground: 77,
                                        sizeYBackground: 56) {
                                router.showGame(level: level)
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
                        .padding(.top, 20)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    let level = 1
    return EgyptLoseView(router: router, level: 1)
}

