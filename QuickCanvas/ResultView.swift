//
//  ResultView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/09/01.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    var body: some View {
        VStack{
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
            .overlay{
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        let image = Image(uiImage: viewModel.combineImages())
                        ShareLink(item: DrawImage(image: image), preview: SharePreview("", image: image)) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 30))
                                .foregroundStyle(.black)
                                .frame(width: 70,height: 70)
                                .background(Color(.tertiarySystemFill))
                                .clipShape(.circle)
                            
                        }
                        
                    }
                    
                }
                .padding(120)
            }
            
            
            .padding(40)
            
            HStack(spacing: 80) {
                Button{
                    viewModel.playAgain()
                } label: {
                    HStack{
                        Text("もう1度遊ぶ")
                        Image(systemName: "arrow.clockwise")
                    }
                    .foregroundStyle(.blue)
                }
                
                Button{
                    viewModel.end()
                } label: {
                    HStack{
                        Text("やめる")
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }
                .foregroundStyle(.red)
                
            }
            .font(.system(size: 55))
        }
    }
    
    struct DrawImage: Transferable {
        static var transferRepresentation: some TransferRepresentation {
            ProxyRepresentation(exporting: \.image)
        }
        
        var image: Image
    }
    
}

//#Preview {
//    let viewModel = ViewModel()
//    viewModel.drawImages = [UIImage(systemName: "map")!]
//    ResultView()
//        .environmentObject(ViewModel())
//}
