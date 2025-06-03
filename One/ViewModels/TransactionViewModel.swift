import SwiftUI
import SwiftData

@Observable
class TransactionViewModel {
    @ObservationIgnored
    private var context: ModelContext

    @Published var amountText: String = ""
    @Published var category: String = ""
    @Published var note: String = ""
    @Published var date: Date = Date()
    @Published var selectedAccount: Account?

    init(context: ModelContext) {
        self.context = context
    }

    func addTransaction() {
        guard let amount = Double(amountText), !category.isEmpty else { return }
        let noteVal = note.isEmpty ? nil : note
        let tx = Transaction(amount: amount, date: date, category: category, note: noteVal, account: selectedAccount)
        context.insert(tx)
        amountText = ""
        category = ""
        note = ""
        date = Date()
    }
}
