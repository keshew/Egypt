import SwiftUI

struct EgyptRulesView: View {
    @StateObject var egyptRulesModel =  EgyptRulesViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var router: Router
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(.rulesBackground)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            
                            if egyptRulesModel.isVisible {
                                Spacer()
                            ZStack {
                                Image(.labelRulesBackground)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.453,
                                           height: geometry.size.height * 0.728)
                                
                                Text(egyptRulesModel.contact.textRules[egyptRulesModel.currentIndex])
                                        .TLHeader(size: 35)
                                        .frame(width: geometry.size.width * 0.33,
                                               height: geometry.size.height * 0.498)
                                        .multilineTextAlignment(.center)
                                        .minimumScaleFactor(0.8)
                                }
                            .padding(.trailing, 50)
                            }
                            
                            Spacer()
                            
                            Image(.womanRules)
                                .resizable()
                                .frame(width: geometry.size.width * 0.321,
                                       height: geometry.size.height)
                                .offset(y: 25)
                                .padding(.trailing, 20)
                        }
                    }
                }
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            egyptRulesModel.isVisible = false
                            egyptRulesModel.currentIndex += 1
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            egyptRulesModel.isVisible = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                        withAnimation {
                            egyptRulesModel.isVisible = false
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
                        withAnimation {
                            router.showGame(level: 1)
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
    return EgyptRulesView(router: router)
}

