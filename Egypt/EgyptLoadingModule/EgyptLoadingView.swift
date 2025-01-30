import SwiftUI

struct EgyptLoadingView: View {
    @StateObject var egyptLoadingModel =  EgyptLoadingViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router = Router()
    @ObservedObject var audioManager = AudioManager.shared
    
    var body: some View {
        NavigationStack(path: $router.path) {
            GeometryReader { geometry in
                if verticalSizeClass == .compact {
                    ZStack {
                        Image(.mainBackground)
                            .resizable()
                            .ignoresSafeArea()
                        
                        VStack(spacing: 0) {
                            Spacer()
                            
                            Text(egyptLoadingModel.contact.loadingProcent[egyptLoadingModel.currentIndex])
                                .TLHeader(size: 60)
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: geometry.size.width * 0.683, height: 14)
                                    .foregroundColor(Color(red: 109/255, green: 75/255, blue: 9/255))
                                    .cornerRadius(15)
                                
                                Rectangle()
                                    .frame(width: geometry.size.width * egyptLoadingModel.contact.size[egyptLoadingModel.currentIndex], height: 14)
                                    .foregroundColor(.white)
                                    .cornerRadius(15)
                                    .offset(x: geometry.size.width * egyptLoadingModel.contact.offset[egyptLoadingModel.currentIndex])
                            }
                        }
                        .padding(.bottom, geometry.size.width < 700 ? 15 : 0)
                        
                      
                    }
                    .navigationDestination(for: AppScreen.self) { screen in
                        switch screen {
                        case .menu:
                            EgyptMenuView(router: router)
                        case .level:
                            EgyptLevelView(router: router)
                        case .settings:
                            EgyptSettingsView(router: router)
                        case .rules:
                            EgyptRulesView(router: router)
                        case .shop:
                            EgyptShopView(router: router)
                        case .game(let level):
                            EgyptGameView(router: router, level: level)
                        }
                    }
                    
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            egyptLoadingModel.currentIndex += 1
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            egyptLoadingModel.currentIndex += 1
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            router.showMenu()
                            audioManager.playBackgroundMusic()
                           
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    EgyptLoadingView()
}

