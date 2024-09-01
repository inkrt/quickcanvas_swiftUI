//
//  RecordView.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/09/01.
//

import SwiftUI

struct RecordView: View {
    
    @State var records: [Record] = []
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: Array(repeating: .init(spacing: 20), count: 4), spacing: 20) {
                ForEach(records) { record in
                    VStack{
                        Image(uiImage: UIImage(data: record.image!)!)
                            .resizable()
                        //                        .frame(height: 200)
                            .scaledToFit()
                        Text(record.odai)
                    }
                }
                
            }
        }
        .onAppear {
            records = SwiftDataHandler.shared.fetchAllRecord()
        }
        
    }
}


#Preview {
    RecordView()
}
