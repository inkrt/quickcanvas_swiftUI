//
//  DrawView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/21.
//

import SwiftUI

struct DrawView: View {
    
    @EnvironmentObject var viewModel:
    ViewModel
    var body: some View {
        ZStack{
            CanvasView(canvasView: $viewModel.canvasView)
                .environmentObject(viewModel)
            VStack{
                HStack{
                    Spacer()
                    Button("終わり！"){
                        viewModel.finishDrawing()
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    DrawView()
        .environmentObject(ViewModel())
}
