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
                        .font(.system(size: 50))
                        .padding(30)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(.white)
                          }
                NavigationLink{
                    RecordView()
                }label: {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.system(size: 50))
                        .padding(30)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(.white)
                }
                .padding(.top,30)
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
