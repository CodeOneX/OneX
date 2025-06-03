import SwiftUI
import SwiftData

struct AddAccountView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        NavigationStack {
            Form {
                TextField("账户名称", text: $viewModel.name)
                TextField("初始余额", text: $viewModel.initialBalanceText)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("新增账户")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("取消") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("保存") {
                        viewModel.addAccount()
                        dismiss()
                    }
                    .disabled(viewModel.name.isEmpty)
                }
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: Account.self, inMemory: true)
    return AddAccountView(viewModel: AccountViewModel(context: container.mainContext))
}
