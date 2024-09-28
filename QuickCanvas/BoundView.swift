//
//  BoundView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/09/29.
//

import SwiftUI

struct BoundView: View {
    @EnvironmentObject var viewModel:
    ViewModel
    var body: some View {
        VStack{
            Button{
                viewModel.previousStep()
            }label: {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 40))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 40)
                    .background(Color(.tertiarySystemFill))
                    .clipShape(RoundedRectangle(cornerRadius: 70))
                    .foregroundStyle(.blue)
            }
            .padding(.trailing, 1000)
            .padding(.bottom, 100)
            
            VStack{
                Text(viewModel.bound)
                    .font(.system(size: 100))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                    .clipShape(RoundedRectangle(cornerRadius: 70))
                
                
                Button{
                    
                }label: {
                    Image(systemName: "shuffle")
                        .font(.system(size: 40))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                        .background(Color(.tertiarySystemFill))
                        .clipShape(RoundedRectangle(cornerRadius: 70))
                        .foregroundStyle(.black)
                }
                
                Button{
                    viewModel.nextStep()
                }label: {
                    HStack{
                        Text("Next")
                        Image(systemName: "chevron.forward")
                    }
                    .font(.system(size: 40))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 70))
                    .foregroundStyle(.white)
                }
                .padding(.bottom, 200)
            }
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    viewModel.selectBound()
    return BoundView()
        .environmentObject(viewModel)
}
