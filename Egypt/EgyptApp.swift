import SwiftUI

@main
struct EgyptApp: App {
    var body: some Scene {
        WindowGroup {
            EgyptLoadingView()
                .onAppear {
                    UserDefaultsManager.shared.firstLaunch()
                }
        }
    }
}
