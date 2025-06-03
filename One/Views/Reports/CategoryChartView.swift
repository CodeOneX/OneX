import SwiftUI
import SwiftData
import Charts

struct CategoryChartView: View {
    @Query private var transactions: [Transaction]

    var body: some View {
        let calendar = Calendar.current
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: Date()))!
        let data = Dictionary(grouping: transactions.filter { $0.date >= startOfMonth }, by: \Transaction.category)
            .map { (key, value) in
                (category: key, total: value.reduce(0) { $0 + $1.amount })
            }
        VStack(alignment: .leading) {
            Text("本月分类支出").font(.headline)
            Chart(data, id: \.(category)) { item in
                BarMark(x: .value("分类", item.category), y: .value("金额", item.total))
                    .foregroundStyle(by: .value("分类", item.category))
            }
            .frame(height: 250)
        }
        .padding()
    }
}

#Preview {
    CategoryChartView()
        .modelContainer(for: [Transaction.self], inMemory: true)
}
