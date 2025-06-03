import SwiftUI

struct MainView: View {
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
    }
}

#Preview {
    MainView()
        .modelContainer(for: [Transaction.self, Account.self, Budget.self], inMemory: true)
}
