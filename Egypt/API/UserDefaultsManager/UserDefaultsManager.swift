import Foundation

enum Keys: String {
    case isBrought = "isBrought"
    case purchasedImages = "purchasedImages"
    case currentLevel = "currentLevel"
    case countOfMoney = "countOfMoney"
    case countOfTimeBonus = "countOfTimeBonus"
    case hasBeenLaunchedBefore = "hasBeenLaunchedBefore"
    case backgroundVolume = "backgroundVolume"
    case soundEffectVolume = "soundEffectVolume"
}

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    let defaults = UserDefaults.standard
    
    private init() {}
    
    func firstLaunch() {
        if UserDefaultsManager().defaults.string(forKey: Keys.countOfMoney.rawValue) == nil {
            UserDefaultsManager().defaults.set(10, forKey: Keys.countOfMoney.rawValue)
            UserDefaultsManager().defaults.set(1,  forKey: Keys.currentLevel.rawValue)
            UserDefaultsManager().defaults.set(2,  forKey: Keys.countOfTimeBonus.rawValue)
            UserDefaultsManager().defaults.set(0.5, forKey: Keys.backgroundVolume.rawValue)
            UserDefaultsManager().defaults.set(0.5, forKey: Keys.soundEffectVolume.rawValue)
        }
    }
    
    func savePurchaseStatus(isBrought: [Bool], images: [String]) {
        defaults.set(isBrought, forKey: Keys.isBrought.rawValue)
        defaults.set(images, forKey: Keys.purchasedImages.rawValue)
    }
    
    func loadPurchaseStatus() -> ([Bool], [String]) {
        let isBrought = defaults.array(forKey: Keys.isBrought.rawValue) as? [Bool] ?? [false, false, false, false]
        let images = defaults.array(forKey: Keys.purchasedImages.rawValue) as? [String] ?? []
        return (isBrought, images)
    }
    
    func buyTimeBonus(countBonus: Int) {
        let money = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        let timeBonus = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfTimeBonus.rawValue) as? Int ?? 0
        if money >= 30 * countBonus {
            UserDefaultsManager.shared.defaults.set(money - 30 * countBonus,  forKey: Keys.countOfMoney.rawValue)
            UserDefaultsManager.shared.defaults.set(timeBonus + countBonus,  forKey: Keys.countOfTimeBonus.rawValue)
            print( UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfTimeBonus.rawValue) as? Int ?? 0)
        }
        
    
    }
    
    func getPurchasedImages() -> [String] {
        return defaults.array(forKey: Keys.purchasedImages.rawValue) as? [String] ?? [EgyptImageName.rulesBackground.rawValue]
     }
    
    func completeLevel() {
        let money = UserDefaultsManager.shared.defaults.object(forKey: Keys.countOfMoney.rawValue) as? Int ?? 0
        let level = UserDefaultsManager.shared.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 0
        
        UserDefaultsManager.shared.defaults.set(money + 10,  forKey: Keys.countOfMoney.rawValue)
        
        if level <= 11 {
            UserDefaultsManager.shared.defaults.set(level + 1,  forKey: Keys.currentLevel.rawValue)
        }
    }
    
    func checkFirstLaunch() -> Bool {
        var isFirstLaunch = false
        let hasBeenLaunchedBefore = UserDefaultsManager.shared.defaults.bool(forKey: Keys.hasBeenLaunchedBefore.rawValue)
        if !hasBeenLaunchedBefore {
            UserDefaultsManager.shared.defaults.set(true, forKey: Keys.hasBeenLaunchedBefore.rawValue)
            isFirstLaunch = true
        } else {
            isFirstLaunch = false
        }
        return isFirstLaunch
    }
    
    func saveVolumeSettings(backgroundVolume: Float, soundEffectVolume: Float) {
        defaults.set(backgroundVolume, forKey: Keys.backgroundVolume.rawValue)
        defaults.set(soundEffectVolume, forKey: Keys.soundEffectVolume.rawValue)
     }
     
     func loadVolumeSettings() -> (Float, Float) {
         let backgroundVolume = defaults.float(forKey: Keys.backgroundVolume.rawValue)
         let soundEffectVolume = defaults.float(forKey: Keys.soundEffectVolume.rawValue)
         return (backgroundVolume, soundEffectVolume)
     }
}
