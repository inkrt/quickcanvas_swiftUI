//
//  OrderView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/07.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        VStack{
            HStack{
                
                Text("◯番目の人は")
                    .font(.system(size: 100))
                   
            }
            HStack{ 
                Text("????")
                    .font(.system(size: 200))
                
                Text("さんです！")
                    .font(.system(size: 100))
                    
            }
            HStack{
                Text("◯秒で描いてください")
                    .font(.system(size:80))
            }
            Button{
            }label: {
                Text("描く")
                    .font(.system(size: 70))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .foregroundStyle(.white)
            }
        }
        .padding(.vertical, 50)
        .padding(.horizontal, 100)
    }
}
#Preview {
    OrderView()
}
