import SwiftUI
import SwiftData

struct AccountListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Account.name) private var accounts: [Account]
    @State private var showAdd = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(accounts) { account in
                    VStack(alignment: .leading) {
                        Text(account.name)
                        Text("初始余额: \(String(format: "%.2f", account.initialBalance))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet { modelContext.delete(accounts[index]) }
                }
            }
            .navigationTitle("账户管理")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { showAdd = true }) { Image(systemName: "plus") }
                }
            }
            .sheet(isPresented: $showAdd) {
                AddAccountView(viewModel: AccountViewModel(context: modelContext))
            }
        }
    }
}

#Preview {
    AccountListView()
        .modelContainer(for: [Account.self], inMemory: true)
}
