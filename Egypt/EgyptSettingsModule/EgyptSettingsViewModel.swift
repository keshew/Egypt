import SwiftUI

class EgyptSettingsViewModel: ObservableObject {
    let contact = EgyptSettingsModel()
    @Published var musicValue = 5.0
    @Published var soundValue = 5.0
}
