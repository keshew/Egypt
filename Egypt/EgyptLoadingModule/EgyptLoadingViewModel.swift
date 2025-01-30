import SwiftUI

class EgyptLoadingViewModel: ObservableObject {
    let contact = EgyptLoadingModel()
    @Published var currentIndex = 0
}
