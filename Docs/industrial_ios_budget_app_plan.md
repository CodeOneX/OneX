## 工业级 iOS 记账 App 模块化教学与开发计划

### 前言

本教学计划旨在帮助零基础开发者逐步完成一款具备工业级质量的 iOS 记账应用。该应用将以 SwiftUI 为界面框架，使用 SwiftData 进行数据持久化，并结合 Apple 的智能和快捷指令功能实现短信自动记账。全文按照模块划分，便于学习者循序渐进地开发、测试和上线。

### 模块目录
1. Swift 与 SwiftUI 基础教学
2. 项目结构与文件组织（MVVM 架构）
3. SwiftData 数据模型搭建
4. 记账逻辑与交易录入界面实现（UI + 逻辑分离）
5. Apple Intelligence 与快捷指令集成（自动识别短信内容生成账单记录）
6. 报表、预算、账户管理等高级功能开发
7. Bug 调试与测试

---

### 模块 1：Swift 与 SwiftUI 基础教学

- **Swift 语言基础**：介绍变量、常量、数据类型、控制流以及函数和结构体的用法。
- **SwiftUI 基础概念**：讲解视图、修饰符、布局容器等基本概念。
- **交互与状态管理**：演示 `@State`、`@Binding` 与 `@StateObject` 的使用方式。

代码示例：
```swift
var welcomeMessage = "Hello"    // 定义变量
let pi = 3.14159                // 定义常量
welcomeMessage = "Hello, Swift" // 修改变量的值
print(welcomeMessage)
```

### 模块 2：项目结构与文件组织（MVVM 架构）

- 新建 SwiftUI 项目，勾选 SwiftData 或手动集成。
- 按照 `Models`、`Views`、`ViewModels`、`Resources`、`Services` 等分组组织文件。
- 通过示例代码阐释 Model、View、ViewModel 三层的作用。

### 模块 3：SwiftData 数据模型搭建

- 介绍 SwiftData 的优势与基本用法。
- 定义 `Transaction` 模型并在 `MyLedgerApp` 中注入 `modelContainer`。
- 使用 `@Query` 结合 `@Environment(\.modelContext)` 在列表中展示和删除数据。

### 模块 4：记账逻辑与交易录入界面实现

- 设计 `TransactionListView` 与 `AddTransactionView`。
- 使用 `Form` 构建录入表单，并在保存时插入数据到 SwiftData。
- 利用 `@Query` 实现插入或删除后界面自动刷新，体现 MVVM 分层思想。

### 模块 5：Apple Intelligence 与快捷指令集成

- 通过自定义 URL Scheme 与快捷指令配合，读取银行短信并解析为账单。
- 说明如何在 `onOpenURL` 中处理 URL，创建 `Transaction` 并保存。
- 指导用户在快捷指令 App 中配置短信触发的个人自动化。

### 模块 6：报表、预算、账户管理等高级功能开发

- **账户管理**：新增 `Account` 模型并在添加交易时选择账户。
- **预算功能**：定义 `Budget` 模型，计算支出与预算的对比并提醒用户。
- **报表分析**：使用 `Charts` 绘制分类分布柱状图等统计界面。
- 简要介绍 SwiftData + CloudKit 实现多设备同步以及数据导入导出思路。

### 模块 7：Bug 调试与测试

- 利用 Xcode 断点、调试器和控制台排查问题。
- 在模拟器和真机上测试不同场景，验证短信自动化等特殊功能。
- 提出编写单元测试与 UI 测试的建议，确保核心逻辑稳定。

---

以上内容即为该记账应用的模块化开发计划。各模块可根据学习进度逐步展开，实现完整的工业级 iOS 记账 App。
