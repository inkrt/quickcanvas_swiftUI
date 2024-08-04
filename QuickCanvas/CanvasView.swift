//
//  CanvasView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/08/04.
//

import SwiftUI
import UIKit
import PencilKit

struct CanvasView: UIViewRepresentable {
   
    @EnvironmentObject var viewModel: ViewModel
    @Binding var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        return canvasView
    }

func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}
