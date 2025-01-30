import SwiftUI

struct EgyptWinView: View {
    @StateObject var egyptWinModel =  EgyptWinViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry   in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.mainBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.winFigure)
                        .resizable()
                        .frame(width: geometry.size.width * 0.356,
                               height: geometry.size.height * 0.542)
                        .offset(x: geometry.size.width * -0.36, y: geometry.size.height * 0.27)

                    VStack {
                        Spacer()
                        VStack(spacing: -25) {
                            ZStack {
                                Image(.backForTime)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.1365,
                                           height: geometry.size.height * 0.19)
                                
                                HStack(spacing: 0){
                                    Text("+10")
                                        .TLHeader(size: 30)
                                    
                                    Image(.coin)
                                        .resizable()
                                        .frame(width: geometry.size.height * 0.07,
                                               height: geometry.size.height * 0.07)
                                        .offset(y: -1.5)
                                }
                            }
                            
                            ZStack {
                                Image(.settingsBack)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.322,
                                           height: geometry.size.height * 0.393)
                                
                                Text("GREAT JOB!")
                                    .TLHeader(size: 35)
                                    .frame(width: 191, height: 33)
                                    .multilineTextAlignment(.center)
                                    .minimumScaleFactor(0.8)
                                
                                
                                StoneButton(foregroundImage: EgyptImageName.resumeArrow.rawValue,
                                            sizeForegroundImage: 31,
                                            sizeXBackground: 77,
                                            sizeYBackground: 56) {
                                    router.showLevel()
                                }
                                            .padding(.top, geometry.size.height * 0.444)
                            }
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
    return EgyptWinView(router: router)
}

