import SwiftData
import Foundation

@Model
class Budget {
    var category: String
    var periodStart: Date
    var periodEnd: Date
    var amount: Double

    init(category: String, periodStart: Date, periodEnd: Date, amount: Double) {
        self.category = category
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.amount = amount
    }
}
