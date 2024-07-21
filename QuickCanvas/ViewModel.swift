//
//  ViewModel.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/21.
//

import SwiftUI

enum Step: Int {
    case modelSelect
    case playerSelect
    case roleSelect
    case odaiSelect
    case readySelect
    case drawSelect
    case answerSelect
    case confirmSelect
    case saveSelect
    case playAgeinSelect
    
    var next: Step? {
        Step(rawValue: self.rawValue + 1)
    }
    
    var previous: Step? {
        Step(rawValue: self.rawValue - 1)
    }
    
    @ViewBuilder
    var view: some View{
        switch self {
        case .modelSelect:
            PlayModeView()
        case .playerSelect:
            PlayerView()
        case .roleSelect:
            DivideView()
        case .odaiSelect:
            OdaiView()
        case .readySelect:
            OrderView()
        case .drawSelect:
            DrawView()
        case .answerSelect:
            AnswerView()
        case .confirmSelect:
            EmptyView()
        case .saveSelect:
            EmptyView()
        case .playAgeinSelect:
            EmptyView()
        }
    }
}

struct Player {
    var name: String
    var color: Color
    var icon: Image
    
    static let colors: [Color] = [.red, .blue, .green, .yellow, .brown, .purple]
    
    static let preview: [Player] = [
        Player(name: "player1", color: .red, icon: Image(uiImage: UIImage())),
        Player(name: "player2", color: .blue, icon: Image(uiImage: UIImage())),
        Player(name: "player3", color: .green, icon: Image(uiImage: UIImage())),
        Player(name: "player4", color: .yellow, icon: Image(uiImage: UIImage()))
    ]
}

class ViewModel: NSObject, ObservableObject {
    @Published var step: Step = .modelSelect
    @Published var players: [Player] = []
    @Published var drawers: [Player] = []
    @Published var answerer: Player = Player(name: "placeholder", color: .red, icon: Image(""))
    @Published var odai: String = ""
    @Published var turn: Int = 0
    @Published var time: Int = 0
    
    func nextStep() {
        step = step.next!
    }
    func previousStep(){
        step = step.previous!
    }
    
    func dividePlayers() {
        answerer = players.randomElement()!
        drawers = players.filter{ $0.name != answerer.name }.shuffled() 
    }
    func selectOdai(){
        odai = ["うさぎ", "ねこ", "いぬ", "キリン", "モルモット", "ひつじ", "ぞう", "さる", "とり", "へび", "かに", "くま", "らいおん", "さめ", "かめ", "りす", "きつね", "らっこ", "くまのこ", "ひよこ", "いるか", "くじら", "かも", "こあら", "ねずみ", "らくだ", "かんがるー", "おおかみ", "とんぼ", "ことり", "さるねこ", "さるこ", "うそうさ", "とらぞう", "さめとり", "かにねこ", "ひつじねずみ", "こあらひつじ", "くじらひよこ", "さるとり", "ぞうかに", "かにぞう", "ねこいぬ", "いぬうさぎ", "とらきつね", "らいおんさめ", "りすくま", "さるくじら", "ぞうひつじ","女の子","男の子","セーラー服"].randomElement()!
    }
    func selectTime(){
        time = Int.random(in: 10...20)
    }
    func finishDrawing(){
        if turn < drawers.count - 1
        {
            previousStep()
            turn += 1
        }else{
        nextStep()
        }
      
        
    }
    
}
