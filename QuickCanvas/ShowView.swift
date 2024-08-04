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
                }
            }
        }
    }
}

#Preview {
    ShowView()
        .environmentObject(ViewModel())
}
