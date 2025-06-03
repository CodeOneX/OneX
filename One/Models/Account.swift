import SwiftData
import Foundation

@Model
class Account {
    var name: String
    var initialBalance: Double

    init(name: String, initialBalance: Double = 0) {
        self.name = name
        self.initialBalance = initialBalance
    }
}
