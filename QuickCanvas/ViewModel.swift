//
//  ViewModel.swift
//  QuickCanvas
//
//  Created by 舛水葵 on 2024/07/21.
//

import SwiftUI
import PencilKit
import AVFoundation

private let timeSound = try!  AVAudioPlayer(data: NSDataAsset(name: "time")!.data)


private func play4Sound(){
    timeSound.play()
   }

enum Step: Int {
    case modelSelect
    case playerSelect
    case roleSelect
//    case ruleSelect
//    case boundSelect
    case odaiSelect
    case readySelect
    case drawSelect
    case showSelect
    case answerSelect
    case resultSelect
    
    var next: Step? {
        Step(rawValue: self.rawValue + 1)
    }
    
    var nexts: Step? {
        Step(rawValue: self.rawValue + 2)
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
//        case .ruleSelect:
//            RuleModeView()
        case .odaiSelect:
            OdaiView()
//        case .boundSelect:
//            BoundView()
        case .readySelect:
            OrderView()
        case .drawSelect:
            DrawView()
        case .showSelect:
            ShowView()
        case .answerSelect:
            AnswerView()
        case .resultSelect:
            ResultView()
            

        }
    }
}

struct Player {
    var name: String
    var color: Color
    var icon: Image
    var hasBound: Bool = false
    
    static let colors: [Color] = [.red, .blue, .green, .yellow, .brown, .purple].shuffled()
    static let images: [Image] = [Image("icon5"), Image("icon2"), Image("icon3"), Image("icon4"), Image("icon1")].shuffled()
    
    static let preview: [Player] = [
        Player(name: "player1", color: .red, icon: images[0]),
        Player(name: "player2", color: .blue, icon: images[1]),
        Player(name: "player3", color: .green, icon: images[2]),
        Player(name: "player4", color: .yellow, icon: images[3])
    ]
}

enum Thickness: String, CaseIterable, Identifiable {
    case small = "細"
    case medium = "中"
    case large = "太"
    
    var id: String { rawValue }
    
    var width: CGFloat {
        switch self {
        case .small:
            3
        case .medium:
            8
        case .large:
            30
        }
    }
    
}

class ViewModel: NSObject, ObservableObject {
    @Published var step: Step = .modelSelect
    @Published var players: [Player] = []
    @Published var drawers: [Player] = []
    @Published var answerer: Player = Player(name: "placeholder", color: .red, icon: Image(""))
    @Published var odai: String = ""
    @Published var turn: Int = 0
    @Published var time: Float = 0
    @Published var remainingTime: Float = 0
    @Published var drawImages: [UIImage] = []
    @Published var bound: String = ""
    
    
    @Published var canvasView = PKCanvasView()
    @Published var thickness: Thickness = .medium
    @Published var isPen: Bool = true
    
    @Published var timer: Timer!
    
    override init(){
        timeSound.prepareToPlay()
    }
    
    func nextStep() {
        step = step.next!
    }
    
    func nextsStep(){
        step = step.nexts!
    }
    
    func previousStep(){
        step = step.previous!
    }
    
    func end() {
        step = .modelSelect
        players = []
        drawers = []
        answerer = Player(name: "placeholder", color: .red, icon: Image(""))
        odai = ""
        turn = 0
        time = 0
        remainingTime = 0
        drawImages = []
        canvasView = PKCanvasView()
        thickness = .medium
        isPen = true
    }
    
    func playAgain(){
        step = .roleSelect
        odai = ""
        turn = 0
        time = 0
        remainingTime = 0
        drawImages = []
        canvasView = PKCanvasView()
        thickness = .medium
        isPen = true
    }
    
//    Player\(players.count + 1)
    
    func addPlayer(){
        players.append(Player(name: "",
                              color: Player.colors[players.count],
                              icon: Player.images[players.count]))
    }
    
    //プレイヤーを減らす関数
    // 中でplayers.removeLast()する
    func removePlayer(){
        players.removeLast()
    }
    
    func dividePlayers() {
        answerer = players.randomElement()!
        drawers = players.filter{ $0.name != answerer.name }.shuffled()
    }
    
    func selectBound(){
        bound = ["目を閉じて","利き手じゃない方で","画面を逆さにして","１筆書きで","線3本だけで","ドットで","足踏みしながら","歌いながら","しりとりしながら"].randomElement()!
    }
  
    
    func selectOdai(){
        odai = ["うさぎ", "ねこ", "いぬ", "キリン", "モルモット", "ひつじ", "ぞう", "さる", "とり", "へび", "かに", "くま", "らいおん", "さめ", "かめ", "りす", "きつね", "らっこ", "くまのこ", "ひよこ", "いるか", "くじら", "かも", "こあら", "ねずみ", "らくだ", "かんがるー", "おおかみ", "とんぼ", "ことり", "さるねこ", "さるこ", "うそうさ", "とらぞう", "さめとり", "かにねこ", "ひつじねずみ", "こあらひつじ", "くじらひよこ", "さるとり", "ぞうかに", "かにぞう", "ねこいぬ", "いぬうさぎ", "とらきつね", "らいおんさめ", "りすくま", "さるくじら", "ぞうひつじ","女の子","男の子","セーラー服", "ビーチバカンス","サーカスショー","ハロウィンナイト","クリスマス","冒険者パーティ","スポーツチーム","宇宙救助ミッション","バンド活動","農場の一日","海の冒険","お化け屋敷","お菓子作り","異世界での冒険"].randomElement()!
    }
    func selectTime(){
        time = Float(Int.random(in: 10...15))
    }
    func finishDrawing(){
        drawImages.append(canvasImage())
        canvasView.drawing = PKDrawing()
        if turn < drawers.count - 1
        {
            previousStep()
            turn += 1
        }else{
            nextStep()
        }
        
        
    }
    func canvasImage() -> UIImage {
        canvasView.drawing.image(from: canvasView.frame, scale: 1)
    }
    
    func updateTool(){
        if isPen {
            canvasView.tool = PKInkingTool(.pen, color: UIColor(drawers[turn].color), width: thickness.width)
        }else{
            canvasView.tool = PKEraserTool(.bitmap, width: thickness.width)
        }
        
    }
    
    @objc func onTimerCalled(){
        if remainingTime == 0 {
            timer.invalidate()
            finishDrawing()
            
        }else{
            withAnimation(.linear(duration: 1)){
                remainingTime -= 1
                 
            
            }
        }
        if remainingTime == 5 {
            play4Sound()
        }
    }
    
    func  startTimer(){
        remainingTime = time
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: true)
        
    }
    
    func undo(){
        if let undoManager = canvasView.undoManager{
            undoManager.undo()
        }
    }
    
    func redo(){
        if let undoManager = canvasView.undoManager{
            undoManager.redo()
        }
    }
    
    func combineImages() -> UIImage {
        guard let firstImage = drawImages.first else { return UIImage() }
        let size = firstImage.size
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        for image in drawImages{
            image.draw(in: CGRect(origin: .zero, size: size))
        }
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return combinedImage!
    }
   
    
    
}
