//
//  HomeView.swift
//  One
//
//  Created by 无限进步 on 6/2/25.
//
import SwiftUI
import Charts

// 支出类别定义，做到可迭代和可识别
enum ExpenseCategory: String, CaseIterable, Identifiable {
    case food, transport, shopping, entertainment, health, others, noExpense
    var id: String { rawValue }
}

// 每日余额模型
struct DailyBalance: Identifiable {
    var id = UUID()
    var day: String
    var amount: Double
}

// 支出模型
struct Expense: Identifiable {
    var id = UUID()
    var name: String
    var amount: Double
    var category: ExpenseCategory
}

struct HomeView: View {
    @State private var userName = "用户"
    @State private var balance: Double = 1250.75
    @State private var dailyBalances: [DailyBalance] = Array(1...30).map { DailyBalance(day: "\($0)", amount: Double.random(in: 1000...1500)) }
    @State private var expenses: [Expense] = [
        Expense(name: "咖啡", amount: 5.0, category: .food),
        Expense(name: "餐饮", amount: 30.0, category: .food),
        Expense(name: "交通", amount: 10.0, category: .transport),
        Expense(name: "服饰", amount: 20.0, category: .shopping),
        Expense(name: "电影", amount: 15.0, category: .entertainment)
    ]


    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("欢迎, \(userName)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("主页")
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                    }
                }

                CardView(balance: balance, dailyBalances: dailyBalances)

                Text("支出记录")
                    .font(.headline)

                List(expenses) { expense in
                    HStack {
                        Text(expense.name)
                        Spacer()
                        Text("¥ \(String(format: "%.2f", expense.amount))")
                            .foregroundColor(.secondary)
                    }
                }
                .listStyle(.plain)

                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("个人简介页面")
            .font(.largeTitle)
    }
}

#Preview {
    HomeView()
}
