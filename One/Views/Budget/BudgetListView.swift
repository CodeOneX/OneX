import SwiftUI
import SwiftData

struct BudgetListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Budget.periodStart) private var budgets: [Budget]
    @Query private var transactions: [Transaction]
    @State private var showAdd = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(budgets) { budget in
                    let spent = transactions.filter { tx in
                        tx.category == budget.category && tx.date >= budget.periodStart && tx.date <= budget.periodEnd
                    }.reduce(0) { $0 + $1.amount }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(budget.category) 预算")
                            Text("周期: \(budget.periodStart, style: .date) - \(budget.periodEnd, style: .date)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(String(format: "上限 ¥%.0f", budget.amount))
                            Text(String(format: "已用 ¥%.0f", spent))
                                .font(.caption)
                                .foregroundColor(spent > budget.amount ? .red : .secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet { modelContext.delete(budgets[index]) }
                }
            }
            .navigationTitle("预算")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) { Button(action: { showAdd = true }) { Image(systemName: "plus") } }
            }
            .sheet(isPresented: $showAdd) {
                AddBudgetView(viewModel: BudgetViewModel(context: modelContext))
            }
        }
    }
}

#Preview {
    BudgetListView()
        .modelContainer(for: [Budget.self, Transaction.self], inMemory: true)
}
