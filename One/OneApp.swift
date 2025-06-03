import SwiftUI
import SwiftData

@main
struct OneApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [Transaction.self, Account.self, Budget.self])
        }
    }
}
