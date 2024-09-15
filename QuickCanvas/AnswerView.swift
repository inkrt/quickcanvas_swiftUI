//
//  AnswerView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/07.
//

import SwiftUI

struct AnswerView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    
    @State var opened = false
    
    var body: some View {
        VStack{
            Text("答えは")
                .font(.system(size: 70))
            
            ZStack{
                Text(viewModel.odai)
                    .font(.system(size: 120))
                    .foregroundStyle(Color(red: 0.39, green: 0.82, blue: 1.0, opacity: 1.0))
                Button {
                    opened = true
                } label: {
                    Image(systemName: "hand.tap.fill")
                        .font(.system(size: 140))
                        .padding(.vertical, 60)
                        .padding(.horizontal, 400)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .foregroundStyle(.white)
                    
                }
                .opacity(opened ? 0 : 1)
            }

            
            
            HStack{
                Spacer()
                Button{
                    viewModel.nextStep()
                    SwiftDataHandler.shared.add(record: Record(odai: viewModel.odai, image: viewModel.combineImages()))
                }label: {
                    HStack{
                        Text("あってた")
                        
                        Image(systemName: "circle")
                    }
                        .font(.system(size: 90))
                        .foregroundStyle(.blue)
                }
                Spacer()
    
                Button{
                    viewModel.nextStep()
                    SwiftDataHandler.shared.add(record: Record(odai: viewModel.odai, image: viewModel.combineImages()))
                }label: {
                    HStack{
                        Text("ちがった")
                        
                        Image(systemName: "xmark")
                    }
                        .font(.system(size: 90))
                        .foregroundStyle(.red)
                }
                Spacer()
            }
            .opacity(opened ? 1 : 0)
         
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    viewModel.selectOdai()
    return AnswerView()
        .environmentObject(viewModel)
}
