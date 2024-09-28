//
//  ModeView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/09/28.
//

import SwiftUI

struct RuleModeView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    var body: some View {
        HStack{
            Button{
                viewModel.nextsStep()
            }label:{
                Text("イージーモード")
                    .font(.system(size: 50))
                    .padding(30)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .foregroundStyle(.white)
            }
            .padding(.trailing, 100)
            
            
            
            
            Button{
                viewModel.nextStep()
            }label:{
                Text("ハードモード")
                    .font(.system(size: 50))
                    .padding(30)
                    .background(.red.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    RuleModeView()
        .environmentObject(ViewModel())
}
