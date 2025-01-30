import SwiftUI

enum AppScreen: Hashable {
   case menu
    case level
    case settings
    case rules
    case game(Int)
    case shop
}

final class Router: ObservableObject {
    @Published var path: [AppScreen] = []
    
    func showMenu() {
        path.append(.menu)
    }
    
    func showShop() {
        path.append(.shop)
    }
    
    func showLevel() {
        path.append(.level)
    }
    
    func showSettings() {
        path.append(.settings)
    }
    
    func showRules() {
        path.append(.rules)
    }
    
    func showGame(level: Int) {
        path.append(.game(level))
    }
    
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
