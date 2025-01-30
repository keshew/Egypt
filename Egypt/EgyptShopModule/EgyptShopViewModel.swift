import SwiftUI

class EgyptShopViewModel: ObservableObject {
    let contact = EgyptShopModel()
    @Published var currentIndex = 0
    @Published var countOfTime = 1
    @Published var countOfMoney = 30
    @Published var isBrought: [Bool] = [false, false, false, false]
    @Published var purchasedImages: [String] = []
    
    init() {
        loadData()
    }
    
    func buyItem(at index: Int, imageName: String) {
        if !isBrought[index] {
            isBrought[index] = true
            purchasedImages.append(imageName)
            UserDefaultsManager.shared.savePurchaseStatus(isBrought: isBrought, images: purchasedImages)
        }
    }
    
    func buyTime(with: Int) {
        UserDefaultsManager.shared.buyTimeBonus(countBonus: with)
    }
    
    func loadData() {
        let (loadedIsBrought, loadedImages) = UserDefaultsManager.shared.loadPurchaseStatus()
        isBrought = loadedIsBrought
        purchasedImages = loadedImages
    }
    
    
    func increaseCurrentIndex() {
        currentIndex += 1
    }
    
    func lowerCurrentIndex() {
        currentIndex -= 1
    }
    
    func increaseTimeCount() {
        countOfTime += 1
        countOfMoney += 30
    }
    
    func lowerTimeCount() {
        countOfTime -= 1
        countOfMoney -= 30
    }
}

