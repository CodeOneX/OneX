import SwiftUI
import SwiftData

@Observable
class AccountViewModel {
    @ObservationIgnored
    private var context: ModelContext

    @Published var name: String = ""
    @Published var initialBalanceText: String = ""

    init(context: ModelContext) {
        self.context = context
    }

    func addAccount() {
        guard !name.isEmpty else { return }
        let balance = Double(initialBalanceText) ?? 0
        let account = Account(name: name, initialBalance: balance)
        context.insert(account)
        name = ""
        initialBalanceText = ""
    }
}
