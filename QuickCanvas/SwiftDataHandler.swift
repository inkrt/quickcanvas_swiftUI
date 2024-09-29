//
//  SwiftDataHandler.swift
//  SwiftDataSample
//
//  Created by Yuki Kuwashima on 2024/07/31.
//

import SwiftData
import UIKit

public class SwiftDataHandler {

    public static let shared = SwiftDataHandler()

    public var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Record.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    public var modelContext: ModelContext

    init() {
        modelContext = ModelContext(sharedModelContainer)
    }
    
    func add(record: Record) {
        modelContext.insert(record)
    }

    func fetchAllRecord() -> [Record] {
        let fetchDesc = FetchDescriptor<Record>(
            predicate: nil,
            sortBy: []
        )
        guard let fetchedDatas = try? modelContext.fetch(fetchDesc) else {
            print("error")
            return []
        }
        return fetchedDatas
    }
}

@Model
class Record {
    var odai: String
//    var isCorrect: Bool
    @Attribute(.externalStorage) var image: Data?
    
    init(odai: String, image: UIImage/*, isCorrect: Bool*/) {
        self.odai = odai
        self.image = image.pngData()
//        self.isCorrect = isCorrect
    }
}
