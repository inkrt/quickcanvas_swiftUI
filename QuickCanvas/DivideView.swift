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
        VStack{
            HStack{
                VStack {
                    Text("描く人")
                        .font(.system(size: 90))
                    HStack {
                        ForEach(0..<viewModel.drawers.count, id: \.self) { index in
                            VStack{
                                
                                viewModel.drawers[index].icon
                                    .resizable()
                                    .frame(width: 200,height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 70))
                                //                                Text("?")
                                //                                    .font(.system(size: 150))
                                //                                    .padding(.vertical, 50)
                                //                                    .padding(.horizontal, 100)
                                //                                    .background(.blue)
                                //                                    .clipShape(RoundedRectangle(cornerRadius: 70))
                                //                                    .foregroundStyle(.white)
                                //
                                
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
                .padding(.trailing, 100)
                VStack{
                    Text("答える人")
                        .font(.system(size: 90))
                    VStack{
                        
                        viewModel.answerer.icon
                            .resizable()
                            .frame(width: 350,height: 350)
                            .clipShape(RoundedRectangle(cornerRadius: 70))
                        //                        Text("?")
                        //                            .font(.system(size: 150))
                        //                            .padding(.vertical, 50)
                        //                            .padding(.horizontal, 100)
                        //                            .background(.blue)
                        //                            .clipShape(RoundedRectangle(cornerRadius: 70))
                        //                            .foregroundStyle(.white)
                        
                        
                        Text(viewModel.answerer.name)
                            .font(.system(size: 70))
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
                
            }
            HStack{
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
                .padding(.trailing, 100)
                Button{
                    viewModel.nextStep()
                }label: {
                    HStack{
                        Text("Next")
                        Image(systemName: "chevron.forward")
                    }
                    .font(.system(size: 40))
                    .padding(.vertical, 30)
                    .padding(.horizontal, 40)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 70))
                    .foregroundStyle(.white)
                    
                }
            }
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
