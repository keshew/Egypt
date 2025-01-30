import SwiftUI

struct EgyptMenuView: View {
    @StateObject var egyptMenuModel =  EgyptMenuViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.mainBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Image(.woman)
                                .resizable()
                                .frame(width: geometry.size.width * 0.3,
                                       height: geometry.size.height + 20)
                                .offset(y: 15)
                                .padding(.leading, geometry.size.width * 0.09)
                            
                            Spacer()

                            VStack(spacing: 30) {
                                RectangleButton(geometry: geometry,
                                                text: "PLAY", action: {
                                    router.showLevel()
                                })
                                
                                RectangleButton(geometry: geometry,
                                                text: "SETTINGS",
                                                textSize: 23,
                                                action: {
                                    router.showSettings()
                                })
                            }
                            Spacer()
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
    return EgyptMenuView(router: router)
}

