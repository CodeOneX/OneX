import SwiftData
import Foundation

@Model
class Transaction {
    var amount: Double
    var date: Date
    var category: String
    var note: String?
    var account: Account?

    init(amount: Double, date: Date = Date(), category: String, note: String? = nil, account: Account? = nil) {
        self.amount = amount
        self.date = date
        self.category = category
        self.note = note
        self.account = account
    }
}
