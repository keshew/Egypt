import SwiftUI

class EgyptRulesViewModel: ObservableObject {
    let contact = EgyptRulesModel()
    @Published var currentIndex = 0
    @Published var isVisible = true
}
