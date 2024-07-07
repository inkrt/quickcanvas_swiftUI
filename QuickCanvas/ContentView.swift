//
//  ContentView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Button {
                
            } label: {
                Text("Hello, world!")
                    .padding(30)
                    .background(.red)
    //                .clipShape(.capsule)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.white)
            }
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            HStack {
                Spacer()
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                    .font(.system(size: 50, weight: .bold))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
