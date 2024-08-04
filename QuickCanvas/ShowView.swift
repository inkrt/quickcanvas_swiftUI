//
//  ShowView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/21.
//

import SwiftUI

struct ShowView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    
    var body: some View {
        VStack{
            Text("この絵のお題はなんでしょう！")
                .foregroundStyle(.blue)
                .font(.system(size: 80))
          
            HStack{
                ForEach(0..<viewModel.drawImages.count, id: \.self) {index in
                    Image(uiImage: viewModel.drawImages[index])
                        .resizable()
                        .scaledToFit()
                }
            }
                Button{
                    viewModel.nextStep()
                }label:{
                              Text("答える")
                        .font(.system(size: 50))
                        .padding(30)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .foregroundStyle(.white)
                          }
        
        }
    }
}

#Preview {
    ShowView()
        .environmentObject(ViewModel())
}
