//
//  File.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/09/25.
//


ForEach(0..<viewModel.drawers.count, id: \.self) { index in
                            VStack{
                                
                                viewModel.drawers[index].icon
                                    .resizable()
                                    .frame(width: 220,height: 220)
                                    .clipShape(RoundedRectangle(cornerRadius: 70))