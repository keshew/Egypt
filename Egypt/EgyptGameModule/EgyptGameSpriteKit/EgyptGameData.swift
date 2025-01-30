import SwiftUI

class EgyptGameData: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var isShop = false
    @Published var isPause = false
    @Published var isStartTimer = false
    @Published var timeLeft = 15
    @Published var triesLeft = 5
    @Published var moneyCount = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
    @Published var timeBonusCount = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfTimeBonus.rawValue) as? Int ?? 0
    @ObservedObject var audioManager = AudioManager.shared
}
