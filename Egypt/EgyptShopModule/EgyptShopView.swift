import SwiftUI

struct EgyptShopView: View {
    @StateObject var egyptShopModel =  EgyptShopViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry   in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(egyptShopModel.contact.backgroundImages[egyptShopModel.currentIndex])
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(egyptShopModel.contact.labelsImages[egyptShopModel.currentIndex])
                        .resizable()
                        .frame(width: geometry.size.width * 0.45,
                               height: geometry.size.height * 0.18)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 9)
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            if egyptShopModel.currentIndex <= 3 {
                                if egyptShopModel.isBrought[egyptShopModel.currentIndex] {
                                    Image(.settingsBack)
                                        .resizable()
                                        .frame(width: 211,
                                               height: 131)
                                        .opacity(0.5)
                                    
                                    Text("UNLOCKED")
                                        .TLHeader(size: 30)
                                        .frame(width: 172, height: 37)
                                        .multilineTextAlignment(.center)
                                        .minimumScaleFactor(0.8)
                                        .opacity(0.5)
                                    
                                } else {
                                    Image(.settingsBack)
                                        .resizable()
                                        .frame(width: 211,
                                               height: 131)
                                    
                                    Text("UNLOCK?")
                                        .TLHeader(size: 35)
                                        .frame(width: 172, height: 37)
                                        .multilineTextAlignment(.center)
                                        .minimumScaleFactor(0.8)
                                    
                                }
                            } else {
                                HStack(spacing: 20) {
                                    StoneButton(foregroundImage: EgyptImageName.minus.rawValue,
                                                sizeForegroundImage: 20,
                                                sizeXBackground: 52,
                                                sizeYBackground: 37) {
                                        egyptShopModel.lowerTimeCount()
                                    }
                                                .opacity(egyptShopModel.countOfTime == 1 ? 0.5 : 1.0)
                                                .disabled(egyptShopModel.countOfTime == 1 ? true : false)
                                    
                                    ZStack {
                                        Image(.settingsBack)
                                            .resizable()
                                            .frame(width: 211,
                                                   height: 131)
                                        
                                        HStack(spacing: 15) {
                                            Image(.shopTime)
                                                .resizable()
                                                .frame(width: 59, height: 59)
                                            
                                            Text(":\(egyptShopModel.countOfTime)")
                                                .TLHeader(size: 60)
                                                .frame(width: 53,
                                                       height: 61)
                                                .multilineTextAlignment(.center)
                                                .minimumScaleFactor(0.8)
                                        }
                                        .offset(x: -5)
                                    }
                                    
                                    
                                    StoneButton(foregroundImage: EgyptImageName.plus.rawValue,
                                                sizeForegroundImage: 20,
                                                sizeXBackground: 52,
                                                sizeYBackground: 37) {
                                        egyptShopModel.increaseTimeCount()
                                    }
                                                .opacity(egyptShopModel.countOfTime == 5 ? 0.5 : 1.0)
                                                .disabled(egyptShopModel.countOfTime == 5 ? true : false)
                                }
                            }
                            
                            if egyptShopModel.currentIndex <= 3 {
                                if !egyptShopModel.isBrought[egyptShopModel.currentIndex] {
                                    StoneButton(foregroundImage: EgyptImageName.done.rawValue,
                                                sizeForegroundImage: 20,
                                                sizeXBackground: 52,
                                                sizeYBackground: 37) {
                                        let money = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
                                        if money >= 30 {
                                            let currentImage = egyptShopModel.contact.backgroundImages[egyptShopModel.currentIndex]
                                            egyptShopModel.buyItem(at: egyptShopModel.currentIndex, imageName: currentImage)
                                            UserDefaultsManager.shared.defaults.set(money - 30,  forKey: Keys.countOfMoney.rawValue)
                                        }
                                    }
                                                .padding(.top, geometry.size.height * 0.368)
                                } else {
                                    StoneButton(foregroundImage: EgyptImageName.done.rawValue,
                                                sizeForegroundImage: 20,
                                                sizeXBackground: 52,
                                                sizeYBackground: 37) {
                                        let money = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
                                        if money >= 30 {
                                            let currentImage = egyptShopModel.contact.labelsImages[egyptShopModel.currentIndex]
                                            egyptShopModel.buyItem(at: egyptShopModel.currentIndex, imageName: currentImage)
                                            UserDefaultsManager.shared.defaults.set(money - 30,  forKey: Keys.countOfMoney.rawValue)
                                        }
                                    }
                                                .opacity(0)
                                                .padding(.top, geometry.size.height * 0.368)
                                }
                            } else {
                                StoneButton(foregroundImage: EgyptImageName.done.rawValue,
                                            sizeForegroundImage: 20,
                                            sizeXBackground: 52,
                                            sizeYBackground: 37) {
                                    egyptShopModel.buyTime(with: egyptShopModel.countOfTime)
                                }
                                            .padding(.top, geometry.size.height * 0.368)
                            }
                        }
                        
                        
                        if egyptShopModel.currentIndex <= 3 {
                            if egyptShopModel.isBrought[egyptShopModel.currentIndex] {
                                ZStack {
                                    Image(.backForTime)
                                        .resizable()
                                        .frame(width: 77, height: 55)
                                    
                                    HStack(spacing: 0) {
                                        Text("\(egyptShopModel.countOfMoney)")
                                            .TLHeader(size: 30)
                                            .frame(width: 40, height: 37)
                                            .minimumScaleFactor(0.7)
                                        
                                        Image(.coin)
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .offset(y: -1.5)
                                    }
                                }
                                .opacity(0)
                                
                            } else {
                                ZStack {
                                    Image(.backForTime)
                                        .resizable()
                                        .frame(width: 77, height: 55)
                                    
                                    HStack(spacing: 0) {
                                        Text("\(egyptShopModel.countOfMoney)")
                                            .TLHeader(size: 30)
                                            .frame(width: 40, height: 37)
                                            .minimumScaleFactor(0.7)
                                        
                                        Image(.coin)
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .offset(y: -1.5)
                                    }
                                }
                            }
                        } else {
                            ZStack {
                                Image(.backForTime)
                                    .resizable()
                                    .frame(width: 77, height: 55)
                                
                                HStack(spacing: 0) {
                                    Text("\(egyptShopModel.countOfMoney)")
                                        .TLHeader(size: 30)
                                        .frame(width: 40, height: 37)
                                        .minimumScaleFactor(0.7)
                                    
                                    Image(.coin)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .offset(y: -1.5)
                                }
                            }
                        }
                        
                        
                        HStack(spacing: 15) {
                            StoneButton(foregroundImage: EgyptImageName.backArrow.rawValue,
                                        sizeForegroundImage: 20,
                                        sizeXBackground: 52,
                                        sizeYBackground: 37) {
                                egyptShopModel.currentIndex -= 1
                            }
                                        .disabled(egyptShopModel.currentIndex == 0 ? true : false)
                                        .opacity(egyptShopModel.currentIndex == 0 ? 0.5 : 1.0)
                            
                            StoneButton(foregroundImage: EgyptImageName.home.rawValue,
                                        sizeForegroundImage: 26,
                                        sizeXBackground: 65,
                                        sizeYBackground: 47) {
                                router.showMenu()
                            }
                            
                            StoneButton(foregroundImage: EgyptImageName.nextArrow.rawValue,
                                        sizeForegroundImage: 20,
                                        sizeXBackground: 52,
                                        sizeYBackground: 37) {
                                egyptShopModel.currentIndex += 1
                            }
                                        .disabled(egyptShopModel.currentIndex == 4 ? true : false)
                                        .opacity(egyptShopModel.currentIndex == 4 ? 0.5 : 1.0)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return EgyptShopView(router: router)
}
