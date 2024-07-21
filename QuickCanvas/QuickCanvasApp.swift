//
//  QuickCanvasApp.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/06/23.
//

import SwiftUI

@main
struct QuickCanvasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
