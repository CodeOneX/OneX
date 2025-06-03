import SwiftUI
import SwiftData

struct AddBudgetView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: BudgetViewModel

    var body: some View {
        NavigationStack {
            Form {
                TextField("分类", text: $viewModel.category)
                DatePicker("开始日期", selection: $viewModel.startDate, displayedComponents: .date)
                DatePicker("结束日期", selection: $viewModel.endDate, displayedComponents: .date)
                TextField("预算金额", text: $viewModel.amountText)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("新增预算")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) { Button("取消") { dismiss() } }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("保存") {
                        viewModel.addBudget()
                        dismiss()
                    }
                    .disabled(viewModel.category.isEmpty || Double(viewModel.amountText) == nil)
                }
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: Budget.self, inMemory: true)
    return AddBudgetView(viewModel: BudgetViewModel(context: container.mainContext))
}
