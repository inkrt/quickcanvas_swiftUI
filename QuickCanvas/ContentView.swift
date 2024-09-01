//
//  ContentView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    var body: some View {
        viewModel.step.view
            .environmentObject(viewModel)
    }
    
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
