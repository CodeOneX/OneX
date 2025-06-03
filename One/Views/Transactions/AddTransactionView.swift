import SwiftUI
import SwiftData

struct AddTransactionView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TransactionViewModel
    var accounts: [Account]

    var body: some View {
        NavigationStack {
            Form {
                Section("金额") {
                    TextField("请输入金额", text: $viewModel.amountText)
                        .keyboardType(.decimalPad)
                }
                Section("分类") {
                    TextField("请输入分类", text: $viewModel.category)
                }
                Section("备注") {
                    TextField("备注", text: $viewModel.note)
                }
                Section("日期") {
                    DatePicker("选择日期", selection: $viewModel.date, displayedComponents: .date)
                }
                Section("账户") {
                    Picker("账户", selection: $viewModel.selectedAccount) {
                        Text("无").tag(Account?.none)
                        ForEach(accounts) { account in
                            Text(account.name).tag(account as Account?)
                        }
                    }
                }
            }
            .navigationTitle("新增账单")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("取消") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("保存") {
                        viewModel.addTransaction()
                        dismiss()
                    }
                    .disabled(Double(viewModel.amountText) == nil || viewModel.category.isEmpty)
                }
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: [Transaction.self, Account.self], inMemory: true)
    return AddTransactionView(viewModel: TransactionViewModel(context: container.mainContext), accounts: [])
}
