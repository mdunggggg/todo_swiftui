//
//  TodoSwiftUiApp.swift
//  TodoSwiftUi
//
//  Created by ByDuo on 3/7/24.
//

import SwiftUI

@main
struct TodoSwiftUiApp: App {
    @StateObject var viewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(viewModel)
        }
    }
}
