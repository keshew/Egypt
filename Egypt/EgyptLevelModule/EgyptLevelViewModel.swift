import SwiftUI

class EgyptLevelViewModel: ObservableObject {
    let contact = EgyptLevelModel()
    @Published var currentIndex: Int = 0
    @Published var columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
}
