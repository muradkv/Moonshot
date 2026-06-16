//
//  MoonshotApp.swift
//  Moonshot
//
//  Created by murad on 03.06.2026.
//

import SwiftUI

@main
struct MoonshotApp: App {
    @State private var mainViewModel = MoonshotMainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MoonshotMainView(viewModel: mainViewModel)
        }
    }
}
