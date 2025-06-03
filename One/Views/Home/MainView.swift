import SwiftUI

struct MainView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        TabView {
            TransactionListView()
                .tabItem { Label("账单", systemImage: "list.bullet") }
            AccountListView()
                .tabItem { Label("账户", systemImage: "creditcard") }
            BudgetListView()
                .tabItem { Label("预算", systemImage: "chart.pie") }
            ReportsView()
                .tabItem { Label("报表", systemImage: "chart.bar") }
        }
        .onOpenURL(perform: handleURL)
    }

    private func handleURL(_ url: URL) {
        guard url.scheme == "myledger" else { return }
        guard url.host == "add", let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }

        let amountStr = components.queryItems?.first(where: { $0.name == "amount" })?.value
        let category = components.queryItems?.first(where: { $0.name == "category" })?.value
        let note = components.queryItems?.first(where: { $0.name == "note" })?.value

        if let amountStr, let amount = Double(amountStr), let category {
            let tx = Transaction(amount: amount, category: category, note: note)
            modelContext.insert(tx)
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: [Transaction.self, Account.self, Budget.self], inMemory: true)
}
