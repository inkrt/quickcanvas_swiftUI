//
//  PlayerView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/07.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        NavigationStack {
            HStack{
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
                    Text("名前")
                        .font(.system(size: 50))
                    Button{
                        
                    }label: {
                        Text("色")
                            .font(.system(size: 40))
                            .padding(.vertical, 30)
                            .padding(.horizontal, 40)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 70))
                            .foregroundStyle(.white)
                    }
                    
                }
                Button {
                    
                } label: {
                    Text("追加")
                        .font(.system(size: 70))
                        .padding(.vertical, 50)
                        .padding(.horizontal, 50)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 70))
                        .foregroundStyle(.white)
                       
                }
                .padding(.horizontal, 100)
                
            
                    NavigationLink(destination:DivideView()) {
                        Text("始める")
                            .font(.system(size: 70))
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
        }
    }
}

#Preview {
    PlayerView()
}
