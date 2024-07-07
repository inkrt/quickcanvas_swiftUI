//
//  AnswerView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/07.
//

import SwiftUI

struct AnswerView: View {
    var body: some View {
        VStack{
            Text("合ってますか？")
                .font(.system(size: 100))
            HStack{
                Spacer()
                Button{
                    
                }label: {
                    Text("⚪︎")
                        .font(.system(size: 140))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 35)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .foregroundStyle(.white)
                }
                Spacer()
    
                Button{
                    
                }label: {
                    Text("×")
                        .font(.system(size: 150))
                        .padding(.vertical, 18)
                        .padding(.horizontal, 55)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .foregroundStyle(.white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    AnswerView()
}
