//
//  PlayerView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/07.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    
    
    
    var body: some View {
        
        
        NavigationStack {
            
            HStack{
                
                ForEach(0..<viewModel.players.count, id: \.self) { index in
                    VStack{
                        Button {
                        } label: {
                            viewModel.players[index].icon
                                .resizable()
                                .frame(width: 240,height: 240)
                                .clipShape(RoundedRectangle(cornerRadius: 70))
                            
                            //                            Image("icon5")
                            //                                .resizable()
                            //                                .scaledToFit()
                            //                            Image(systemName: "person.circle")
                            //                                .font(.system(size: 150))
                            //                                .padding(.vertical, 50)
                            //                                .padding(.horizontal, 100)
                            //                                .background(.blue)
                            //                                .clipShape(RoundedRectangle(cornerRadius: 70))
                            //                                .foregroundStyle(.white)
                            
                        }
                        TextField("名前を入力", text: $viewModel.players[index].name)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 50))
                        Button{
                            
                        }label: {
                            Image(systemName: "scribble.variable")
                                .font(.system(size: 40))
                                .padding(.vertical, 30)
                                .padding(.horizontal, 40)
                                .clipShape(RoundedRectangle(cornerRadius: 70))
                                .foregroundStyle(viewModel.players[index].color)
                        }
                        
                    }
                }
                if viewModel.players.count < 4 {
                    Button {
                        viewModel.addPlayer()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 70))
                            .padding(.vertical, 30)
                            .padding(.horizontal, 30)
                            .background(Color(.tertiarySystemFill))
                            .clipShape(RoundedRectangle(cornerRadius: 200))
                            .foregroundStyle(.black)
                        
                    }
                    //                    .disabled(viewModel.players.count >= 4)
                    .padding(.horizontal, 50)
                }
            }
            
            Button{
                viewModel.nextStep()
                viewModel.dividePlayers()
                
            }label: {
                HStack{
                    Text("Next")
                    Image(systemName: "chevron.forward")
                }
                .font(.system(size: 50))
                .padding(30)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .foregroundStyle(.white)
            }
            
            
            
            //            VStack{
            //                Spacer()
            //            Button {
            //
            //            } label: {
            //                Text("始める")
            //                    .font(.system(size: 40))
            //                    .padding(.vertical, 50)
            //                    .padding(.horizontal, 50)
            //                    .background(.red)
            //                    .clipShape(RoundedRectangle(cornerRadius: 70))
            //                    .foregroundStyle(.white)
            //            }
            //
            //        }
            
        }
        .onAppear {
            viewModel.addPlayer()
            viewModel.addPlayer()
        }
    }
}

#Preview {
    PlayerView()
        .environmentObject(ViewModel())
}
