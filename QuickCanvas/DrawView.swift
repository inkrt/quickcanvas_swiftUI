//
//  DrawView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/21.
//

import SwiftUI
import AVFoundation

struct DrawView: View {
    
    @EnvironmentObject var viewModel:
    ViewModel
    
    
    
    var body: some View {
        ZStack{
            CanvasView(canvasView: $viewModel.canvasView)
                .environmentObject(viewModel)
            
            
            VStack {
                HStack {
                    viewModel.drawers[viewModel.turn].icon
                        .resizable()
                        .frame(width: 100,height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(color: viewModel.drawers[viewModel.turn].color, radius: 1, x: 3, y: 3)
                    
                    
                    
                    Text(viewModel.drawers[viewModel.turn].name)
                        .font(.system(size: 50))
                        .shadow(color: viewModel.drawers[viewModel.turn].color, radius: 6, x: 3, y: 3)
                        .foregroundStyle(.white)
                    
//               .foregroundStyle(viewModel.drawers[viewModel.turn].color)
                    
                    Spacer()
                    
                }
                .padding(.bottom, 575)
                .padding(.leading, 30)
            }
        }
              
        
        Gauge(value: viewModel.remainingTime, in: 0...viewModel.time)
        {
            Text("")
        }
        .tint(viewModel.drawers[viewModel.turn].color)
        .labelsHidden()
        
       
        
        HStack(spacing: 100){
            
            
            Button {
                viewModel.isPen.toggle()
                viewModel.updateTool()
            } label: {
                Image(systemName: viewModel.isPen ? "pencil.tip" : "eraser")
                    .foregroundStyle(.black)
                    .frame(width: 50,height: 50)
                    .background(Color(.tertiarySystemFill))
                    .clipShape(.circle)
                
                
            }
            
            
            Picker("太さ", selection: $viewModel.thickness) {
                ForEach(Thickness.allCases) {
                    thickness in
                    Text(thickness.rawValue)
                        .font(.title)
                        .tag(thickness)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 200)
            .onChange(of: viewModel.thickness){
                viewModel.updateTool()
            }
            HStack(spacing: 20){
                Button{
                    viewModel.undo()
                } label: {
                    Image(systemName: "arrow.turn.up.left")
                        .foregroundStyle(.black)
                }
                
                Button{
                    viewModel.redo()
                } label: {
                    Image(systemName: "arrow.turn.up.right")
                        .foregroundStyle(.black)
                }
                
                
            }
        }
        .padding(.vertical, 10)
        .onAppear{
//            viewModel.startTimer()
            viewModel.updateTool()
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    viewModel.drawers = Player.preview
    viewModel.time = 15
    viewModel.remainingTime = 15
    return DrawView()
        .environmentObject(viewModel)
}
