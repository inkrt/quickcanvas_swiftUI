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
            Text("この絵のお題はなんでしょう")
                .foregroundStyle(.black)
                .font(.system(size: 50))
          
            ZStack{
                ZStack{
                    ForEach(0..<viewModel.drawImages.count, id: \.self) {index in
                        Image(uiImage: viewModel.drawImages[index])
                            .resizable()
                            .scaledToFit()
                    }
                }
                .padding(5)
                
                Image("gakubuti")
                    .resizable()
                    .scaledToFit()
            }
                Button{
                    viewModel.nextStep()
                }label:{
                    HStack{
                        Text("答える")
                        Image(systemName: "lightbulb.min.fill")
                    }
                        .font(.system(size: 40))
                        .padding(15)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(.white)
                          }
                .padding(.top, 20)
                .padding(.bottom, 30)
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    viewModel.drawImages = [UIImage(systemName: "map")!, UIImage(systemName: "map")!, UIImage(systemName: "map")!]
    return ShowView()
        .environmentObject(viewModel)
}
