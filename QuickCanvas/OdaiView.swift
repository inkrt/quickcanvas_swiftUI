//
//  OdaiView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/06/23.
//

import SwiftUI

struct OdaiView: View {
    var body: some View {
        VStack{
            HStack{
                
                Text("お題は")
                    .font(.system(size: 140))
                Spacer()
            }
//            .padding(.top, 100)
//            .padding(.leading, 50)
            Button {
                
            } label: {
                Text("答える人は見ないでください！")
                    .font(.system(size: 50))
                    .padding(.vertical, 60)
                    .padding(.horizontal, 100)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 70))
                    .foregroundStyle(.white)
                    
            }
            
            HStack{
                Spacer()
                Text("です！")
                    .font(.system(size: 100))
                    
            }
        }
        .padding(.vertical, 50)
        .padding(.horizontal, 100)
    }
        
}
#Preview {
    OdaiView()
}
