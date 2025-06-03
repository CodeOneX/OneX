import SwiftUI
import SwiftData

struct TransactionListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Transaction.date, order: .reverse) private var transactions: [Transaction]
    @Query(sort: \Account.name) private var accounts: [Account]

    @State private var showAdd = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(transactions) { tx in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(tx.category)
                                .font(.headline)
                            if let note = tx.note {
                                Text(note)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(String(format: "¥%.2f", tx.amount))
                                .bold()
                            Text(tx.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet { modelContext.delete(transactions[index]) }
                }
            }
            .navigationTitle("账单")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { showAdd = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAdd) {
                AddTransactionView(viewModel: TransactionViewModel(context: modelContext), accounts: accounts)
            }
        }
    }
}

#Preview {
    TransactionListView()
        .modelContainer(for: [Transaction.self, Account.self], inMemory: true)
}
