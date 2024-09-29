//
//  OrderView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/07.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    var body: some View {
        VStack{
            
            HStack{
                
                Text("\(viewModel.turn + 1)番目の人は")
                    .font(.system(size: 80))
                   
            }
            HStack{ 
                Text(viewModel.drawers[viewModel.turn].name)
                    .font(.system(size: 110))
                    .foregroundStyle(viewModel.drawers[viewModel.turn].color)
                
                Text("さんです")
                    .font(.system(size: 80))
                    
            }
            HStack{
                Text("\(Int(viewModel.time))秒で")
                    .font(.system(size:90))
                    .multilineTextAlignment(.center)
                
            }
            HStack{
                Text(viewModel.drawers[viewModel.turn].hasBound ?viewModel.bound : "")
                    .font(.system(size: 70))
                    .foregroundStyle(viewModel.drawers[viewModel.turn].color)
                Text("描いてください")
                    .font(.system(size: 60))
            }
            Button{
                viewModel.nextStep()
            }label: {
                HStack{
                    Text("描く")
                    Image(systemName: "paintbrush.pointed.fill")
                }
                    .font(.system(size: 70))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .foregroundStyle(.white)
            }
        }
        .padding(.vertical, 50)
        .padding(.horizontal, 100)
        
        .onAppear{
            viewModel.selectTime()
            viewModel.selectBound()
        }
    }

}
#Preview {
    let viewModel = ViewModel()
    viewModel.players = Player.preview
    viewModel.dividePlayers()
    return OrderView()
        .environmentObject(viewModel)
}
