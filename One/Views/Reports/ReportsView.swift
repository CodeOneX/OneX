import SwiftUI

struct ReportsView: View {
    var body: some View {
        ScrollView { CategoryChartView() }
            .navigationTitle("报表")
    }
}

#Preview {
    ReportsView()
        .modelContainer(for: [Transaction.self], inMemory: true)
}
