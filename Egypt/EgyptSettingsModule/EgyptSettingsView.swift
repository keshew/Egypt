import SwiftUI

struct EgyptSettingsView: View {
    @StateObject var egyptSettingsModel =  EgyptSettingsViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.mainBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(.settingsLabel)
                        .resizable()
                        .frame(width: geometry.size.width * 0.421,
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
                            
                            
                            VStack(spacing: 20) {
                                HStack {
                                    Image(.sound)
                                        .resizable()
                                        .frame(width: 39, height: 39)
                                    
                                    CustomSlider(value: $egyptSettingsModel.soundValue,
                                                 range: 0...10,
                                                 sizeSlider: geometry.size.width * 0.178)
                                }
                                
                                HStack {
                                    Image(.music)
                                        .resizable()
                                        .frame(width: 31, height: 31)
                                        .offset(x: -7)
                                    
                                    CustomSlider(value: $egyptSettingsModel.musicValue,
                                                 range: 0...10,
                                                 sizeSlider: geometry.size.width * 0.178)
                                }
                            }
                            
                            StoneButton(foregroundImage: EgyptImageName.done.rawValue,
                                        sizeForegroundImage: 34,
                                        sizeXBackground: 77,
                                        sizeYBackground: 56) {
                                //save position slider
                            }
                                        .padding(.top, geometry.size.height * 0.444)
                        }
                        
                        StoneButton(foregroundImage: EgyptImageName.home.rawValue,
                                    sizeForegroundImage: 26,
                                    sizeXBackground: 65,
                                    sizeYBackground: 47) {
                            router.back()
                        }
                                    .padding(.top, 15)
                    }
                    .padding(.bottom)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @ObservedObject var router = Router()
    return EgyptSettingsView(router: router)
}

