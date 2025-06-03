import SwiftUI
import SwiftData

@Observable
class BudgetViewModel {
    @ObservationIgnored
    private var context: ModelContext

    @Published var category: String = ""
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
    @Published var amountText: String = ""

    init(context: ModelContext) {
        self.context = context
    }

    func addBudget() {
        guard !category.isEmpty, let amount = Double(amountText) else { return }
        let budget = Budget(category: category, periodStart: startDate, periodEnd: endDate, amount: amount)
        context.insert(budget)
        category = ""
        amountText = ""
        startDate = Date()
        endDate = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
    }
}
