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
    var body: some View {
        VStack{
            HStack{
                Text("お題は")
                    .font(.system(size: 140))
                Spacer()
            }
//            .padding(.top, 100)
//            .padding(.leading, 50)
            ZStack{
                Text(viewModel.odai)
                    .font(.system(size: 160))
                    .foregroundStyle(.red)
                Button {
                    viewModel.selectOdai()
                } label: {
                    Text("答える人は見ないでください！")
                        .font(.system(size: 50))
                        .padding(.vertical, 80)
                        .padding(.horizontal, 100)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 70))
                        .foregroundStyle(.white)
                    
                }
                .opacity(viewModel.odai.isEmpty ? 1 : 0)
            }
            
            HStack{
                Spacer()
                Text("です！")
                    .font(.system(size: 100))
            }
            HStack{
                Spacer()
                Button{
                    viewModel.nextStep()
                }label: {
                    Text("始める")
                        .font(.system(size: 40))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 80)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 70))
                        .foregroundStyle(.white)
                }
            }
        }
        .padding(.vertical, 50)
        .padding(.horizontal, 100)
    }
        
}
#Preview {
    OdaiView()
        .environmentObject(ViewModel())
}
