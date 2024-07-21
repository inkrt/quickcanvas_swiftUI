//
//  PlayModeView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/06/23.
//

import SwiftUI

struct PlayModeView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    var body: some View {
    
        NavigationStack {
            VStack{
                Text("QiuckCanvas")
                    .foregroundStyle(.blue)
                    .font(.system(size: 180))
                
        
                Button{
                    viewModel.nextStep()
                }label:{
                              Text("友達と遊ぶ")
                        .font(.system(size: 70))
                        .padding(30)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .foregroundStyle(.white)
                          }
                
            }
                
                
                
                //                Button {
                //
                //                } label: {
                //                    Text("友達と遊ぶ")
                //                        .font(.system(size: 70))
                //                        .padding(30)
                //                        .background(.blue)
                //                    //                .clipShape(.capsule)
                //                        .clipShape(RoundedRectangle(cornerRadius: 10))
                //                        .foregroundStyle(.white)
                //                }
            }
            
        }
    }


#Preview {
    PlayModeView()
        .environmentObject(ViewModel())
}
