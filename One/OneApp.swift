//
//  OneApp.swift
//  One
//
//  Created by 无限进步 on 5/31/25.
//

//import SwiftUI：引入 SwiftUI 框架。SwiftUI 是用于构建用户界面的框架，提供了 View、App 等关键协议和结构体。
import SwiftUI
import SwiftData

//@main：属性包装器，表示应用程序的入口。SwiftUI 要求应用的入口点用 @main 标记一个 App 协议的实现。@main 替代了传统 main.swift 文件，自动生成应用生命周期代码。
@main
//struct OneApp: App {：定义一个名为 OneApp 的结构体，遵循 App 协议。结构体struct是 Swift 的一种数据类型，这里我们定义应用本身为一个结构体。App 协议要求实现一个计算属性 body，描述应用的场景scene。
struct OneApp: App {

    var body: some Scene {  //定义应用的主体场景。body 是 App 协议要求的属性，类型为 some Scene。some Scene 表示返回某种具体的 Scene（场景）类型（不透明返回类型）。在 SwiftUI 中，应用的场景通常是一个或多个窗口组（WindowGroup），此属性返回描述为场景的应用程序内容。场景包含定义应用程序用户界面的视图层次结构。SwiftUI提供不同类型的场景，包括WindowGroup、Window、DocumentGroup和Settings。。
        WindowGroup {   //创建一个窗口组场景。对于 iOS 应用，WindowGroup 表示应用的主窗口容器。当应用启动时，SwiftUI 会在此 WindowGroup 中创建视图层次结构。大括号内定义该窗口中要展示的初始视图。此示例使用WindowGroup场景来表示应用程序显示的主窗口。SwiftUI为WindowGroup提供了特定于平台的行为。例如，在 macOS 和 iPadOS 中，一个人可以从群组中打开多个窗口。在 macOS 中，一个人可以将窗口组的多个实例合并成一组标签。如果您正在创建基于文档的应用程序，如文字处理器或文本编辑器，您可以使用DocumentGroup场景来打开、保存和编辑文档。
            HomeView()  //应用启动后显示的根视图。函数调用：HomeView() 构造并返回一个 SwiftUI 视图。SwiftUI 会将其作为 WindowGroup 的内容显示。
        }
    }
}
