//
//  OdaiView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/06/23.
//

import SwiftUI

struct OdaiView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    
    @State var opened = false
    
    var body: some View {
        VStack{
            HStack{
                Text("お題は")
                    .font(.system(size: 100))
                Spacer()
            }
            .padding(.top, 30)
            .padding(.leading, 50)
            ZStack{
                Text(viewModel.odai)
                    .font(.system(size: 100))
                    .foregroundStyle(.red)
                
                Button {
                    viewModel.selectOdai()
                    opened = true
                } label: {
                    HStack  {
                        Text(viewModel.answerer.name)
                        Text("さんは見ないでください！")
                    }
                        .font(.system(size: 45))
                        .padding(.vertical, 70)
                        .padding(.horizontal, 80)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .foregroundStyle(.white)
                    
                }
                .opacity(viewModel.odai.isEmpty ? 1 : 0)
                .opacity(opened ? 0 : 1)
            }
            
            
            HStack{
                Spacer()
                Button{
                    viewModel.nextStep()
                }label: {
                    HStack{
                        Text("Next")
                        Image(systemName: "chevron.forward")
                    }
                        .font(.system(size: 40))
                        .padding(.vertical, 40)
                        .padding(.horizontal, 50)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .foregroundStyle(.white)
                }
                .opacity(opened ? 1 : 0)
            }
            .padding(.top, 50)
        }
        .padding(.vertical, 50)
        .padding(.horizontal, 100)
    }
        
}
#Preview {
    OdaiView()
        .environmentObject(ViewModel())
}
