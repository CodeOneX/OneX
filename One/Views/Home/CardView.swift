import SwiftUI

struct CardView: View {
    var balance: Double
    var dailyBalances: [DailyBalance]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("总余额")
                .font(.caption)
                .foregroundColor(.secondaryText)
            Text("¥ \(String(format: "%.2f", balance))")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primaryText)

            Chart(dailyBalances) { item in
                LineMark(
                    x: .value("Day", item.day),
                    y: .value("Amount", item.amount)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(.primaryText)
            }
            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
            .frame(height: 100)

            Spacer(minLength: 0)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 180, maxHeight: 220)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.67, blue: 0.33),
                    Color(red: 0.94, green: 0.47, blue: 0.48),
                    Color(red: 0.79, green: 0.49, blue: 0.98)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    CardView(balance: 1024.0, dailyBalances: [
        DailyBalance(day: "1", amount: 1000),
        DailyBalance(day: "2", amount: 1100)
    ])
}
