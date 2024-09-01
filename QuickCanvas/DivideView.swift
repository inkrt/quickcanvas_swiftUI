//
//  DivideView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/07.
//

import SwiftUI

struct DivideView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    var body: some View {
        
        HStack{
            VStack {
                Text("描く人")
                    .font(.system(size: 90))
                HStack {
                    ForEach(0..<viewModel.drawers.count, id: \.self) { index in
                        VStack{
                            Button {
                            } label: {
                                Text("?")
                                    .font(.system(size: 150))
                                    .padding(.vertical, 50)
                                    .padding(.horizontal, 100)
                                    .background(.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 70))
                                    .foregroundStyle(.white)
                                
                            }
                            Text(viewModel.drawers[index].name)
                                .font(.system(size: 50))
                                .foregroundStyle(viewModel.drawers[index].color)
                            
//                            Button{
//                                
//                            }label: {
//                                Image(systemName: "scribble.variable")
//                                    .font(.system(size: 40))
//                                    .padding(.vertical, 30)
//                                    .padding(.horizontal, 40)
//                                    .clipShape(RoundedRectangle(cornerRadius: 70))
//                                    .foregroundStyle(viewModel.drawers[index].color)
//                            }
//                            
                            
                        }
                        
                    }
                }
            }
            VStack{
                Text("答える人")
                    .font(.system(size: 90))
                VStack{
                    Button {
                    } label: {
                        Text("?")
                            .font(.system(size: 150))
                            .padding(.vertical, 50)
                            .padding(.horizontal, 100)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 70))
                            .foregroundStyle(.white)
                        
                    }
                    Text(viewModel.answerer.name)
                        .font(.system(size: 50))
                        .foregroundStyle(viewModel.answerer.color)
                    
//                    Button{
//                        
//                    }label: {
//                        Image(systemName: "scribble.variable")
//                            .font(.system(size: 40))
//                            .padding(.vertical, 30)
//                            .padding(.horizontal, 40)
//                            .clipShape(RoundedRectangle(cornerRadius: 70))
//                            .foregroundStyle(viewModel.answerer.color)
//                    }
                    
                    
                }
            }
            Button{
                viewModel.nextStep()
            }label: {
                Text("次へ")
                    .font(.system(size: 40))
                    .padding(.vertical, 30)
                    .padding(.horizontal, 40)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 70))
                    .foregroundStyle(.white)
           
            }
        }
        Button{
            viewModel.dividePlayers()
        }label: {
            Image(systemName: "shuffle")
                .font(.system(size: 40))
                .padding(.vertical, 30)
                .padding(.horizontal, 40)
                .background(Color(.tertiarySystemFill))
                .clipShape(RoundedRectangle(cornerRadius: 70))
                .foregroundStyle(.black)
        }
        
    }
}

#Preview {
    let viewModel = ViewModel()
    viewModel.players = Player.preview
    viewModel.dividePlayers()
    return DivideView()
        .environmentObject(viewModel)
}
