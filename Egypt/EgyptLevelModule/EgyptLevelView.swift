import SwiftUI

struct EgyptLevelView: View {
    @StateObject var egyptLevelModel =  EgyptLevelViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.mainBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.figure)
                        .resizable()
                        .frame(width: geometry.size.width * 0.201,
                               height: geometry.size.height * 0.635)
                        .offset(y: geometry.size.height * 0.103)
                    
                    Image(.levelsLabel)
                        .resizable()
                        .frame(width: geometry.size.width * 0.421,
                               height: geometry.size.height * 0.418)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 4.9)
                    
                    VStack {
                    Spacer()
                        HStack(spacing: geometry.size.width * 0.41) {
                            LazyVGrid(columns: egyptLevelModel.columns,
                                      spacing: geometry.size.height * 0.055) {
                                ForEach(egyptLevelModel.currentIndex..<egyptLevelModel.currentIndex + 6, id: \.self) { index in
                                    if (UserDefaultsManager.shared.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0) <= index {
                                        LockedLevel(geometry: geometry)
                                    } else {
                                        OpenLevel(text: "\(index + 1)",
                                                  geometry: geometry) {
                                            if UserDefaultsManager.shared.checkFirstLaunch() {
                                                router.showRules()
                                            } else {
                                                router.showGame(level: index + 1)
                                            }
                                        }
                                    }
                                }
                            }
                            
                            LazyVGrid(columns: egyptLevelModel.columns,
                                      spacing: geometry.size.height * 0.055) {
                                ForEach(egyptLevelModel.currentIndex + 6..<egyptLevelModel.currentIndex + 12, id: \.self) { index in
                                    if (UserDefaultsManager.shared.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0) <= index {
                                        LockedLevel(geometry: geometry)
                                    } else {
                                        OpenLevel(text: "\(index + 1)",
                                                  geometry: geometry) {
                                            if UserDefaultsManager.shared.checkFirstLaunch() {
                                                router.showRules()
                                            } else {
                                                router.showGame(level: index + 1)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        HStack(spacing: 30) {
                            StoneButton(foregroundImage: EgyptImageName.backArrow.rawValue,
                                        sizeForegroundImage: 20,
                                        sizeXBackground: 52,
                                        sizeYBackground: 37) {
                                egyptLevelModel.currentIndex -= 12
                            }
                                        .disabled(egyptLevelModel.currentIndex == 0 ? true : false)
                            
                            StoneButton(foregroundImage: EgyptImageName.home.rawValue,
                                        sizeForegroundImage: 26,
                                        sizeXBackground: 65,
                                        sizeYBackground: 47) {
                                router.back()
                            }
                            
                            StoneButton(foregroundImage: EgyptImageName.nextArrow.rawValue,
                                        sizeForegroundImage: 20,
                                        sizeXBackground: 52,
                                        sizeYBackground: 37) {
                                egyptLevelModel.currentIndex += 12
                            }
                                        .disabled(egyptLevelModel.currentIndex == 12 ? true : false)
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
    return EgyptLevelView(router: router)
}

