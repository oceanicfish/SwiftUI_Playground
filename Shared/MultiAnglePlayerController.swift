//
//  MultiAnglePlayerController.swift
//  SwiftUI_Playgroud (iOS)
//
//  Created by Hey Fisher on 2020/11/25.
//

import Foundation
import UIKit
import AVKit

let SCREEN_WIDTH : CGFloat = UIScreen.main.bounds.width
let SCREEN_HEIGHT : CGFloat = UIScreen.main.bounds.height - (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
let SUB_HEIGHT : CGFloat = (UIScreen.main.bounds.height - (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)) / 3
let SUB_WIDTH : CGFloat = SUB_HEIGHT * 16 / 9

class MultiAnglePlayerController : UIViewController {
    
    var player : AVPlayer?
    
    let playerViewC: CenterView = {
        let playerViewFrame = CGRect(x: 0, y: 0, width: 0, height:0)
        let playerViewC = CenterView.init(frame: playerViewFrame)
        playerViewC.translatesAutoresizingMaskIntoConstraints = false
        return playerViewC
    }()
    
    let playerView1: PlayerView = {
        let playerViewFrame = CGRect(x: 0, y: 0, width: SUB_WIDTH - 2 , height: SUB_HEIGHT - 2)
        let playerView1 = PlayerView.init(frame: playerViewFrame)
        playerView1.index = 1
        return playerView1
    }()
    
    let playerView2: PlayerView = {
        let playerViewFrame = CGRect(x: 0, y: SUB_HEIGHT, width: SUB_WIDTH - 2, height: SUB_HEIGHT - 2)
        let playerView2 = PlayerView.init(frame: playerViewFrame)
        playerView2.index = 2
        return playerView2
    }()
    
    let playerView3: PlayerView = {
        let playerViewFrame = CGRect(x: 0, y: SUB_HEIGHT * 2, width: SUB_WIDTH - 2, height: SUB_HEIGHT - 2)
        let playerView3 = PlayerView.init(frame: playerViewFrame)
        playerView3.index = 3
        return playerView3
    }()
    
    let playerView4: PlayerView = {
        let playerViewFrame = CGRect(x: SCREEN_WIDTH - SUB_WIDTH, y: 0, width: SUB_WIDTH - 2 , height: SUB_HEIGHT - 2)
        let playerView4 = PlayerView.init(frame: playerViewFrame)
        playerView4.index = 4
        return playerView4
    }()
    
    let playerView5: PlayerView = {
        let playerViewFrame = CGRect(x: SCREEN_WIDTH - SUB_WIDTH, y: SUB_HEIGHT, width: SUB_WIDTH - 2, height: SUB_HEIGHT - 2)
        let playerView5 = PlayerView.init(frame: playerViewFrame)
        playerView5.index = 5
        return playerView5
    }()
    
    let playerView6: PlayerView = {
        let playerViewFrame = CGRect(x: SCREEN_WIDTH - SUB_WIDTH, y: SUB_HEIGHT * 2, width: SUB_WIDTH - 2, height: SUB_HEIGHT - 2)
        let playerView6 = PlayerView.init(frame: playerViewFrame)
        playerView6.index = 6
        return playerView6
    }()
    
    override func viewDidLoad() {
        
        self.view.addSubview(playerView1)
        self.view.addSubview(playerView2)
        self.view.addSubview(playerView3)
        self.view.addSubview(playerView4)
        self.view.addSubview(playerView5)
        self.view.addSubview(playerView6)
        self.view.addSubview(playerViewC)
        
        playerView1.setCenterView(centerView: playerViewC)
        playerView2.setCenterView(centerView: playerViewC)
        playerView3.setCenterView(centerView: playerViewC)
        playerView4.setCenterView(centerView: playerViewC)
        playerView5.setCenterView(centerView: playerViewC)
        playerView6.setCenterView(centerView: playerViewC)
        
        self.player = AVPlayer(url: URL.init(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!)
        
        setupLayout()
        
        self.player?.play()
        
    }
    
    func setupLayout() {
        
        let subPlayerLayer1 = AVPlayerLayer.init(player: self.player)
        subPlayerLayer1.videoGravity = .resizeAspectFill
        playerView1.setPlayerLayer(layer: subPlayerLayer1)
        playerView1.playerLayer?.frame = CGRect(x: 0, y: 0, width: playerView1.frame.width * 2, height: playerView1.frame.height * 3)
        
        let subPlayerLayer2 = AVPlayerLayer.init(player: self.player)
        subPlayerLayer2.videoGravity = .resizeAspectFill
        playerView2.setPlayerLayer(layer: subPlayerLayer2)
        playerView2.playerLayer?.frame = CGRect(x: 0, y: playerView2.frame.height * -1, width: playerView2.frame.width * 2, height: playerView2.frame.height * 3)
        
        let subPlayerLayer3 = AVPlayerLayer.init(player: self.player)
        subPlayerLayer3.videoGravity = .resizeAspectFill
        playerView3.setPlayerLayer(layer: subPlayerLayer3)
        playerView3.playerLayer?.frame = CGRect(x: 0, y: (SCREEN_HEIGHT - SUB_HEIGHT) * -1, width: playerView3.frame.width * 2, height: playerView3.frame.height * 3)

        let subPlayerLayer4 = AVPlayerLayer.init(player: self.player)
        subPlayerLayer4.videoGravity = .resizeAspectFill
        playerView4.setPlayerLayer(layer: subPlayerLayer4)
        playerView4.playerLayer?.frame = CGRect(x: SUB_WIDTH * -1, y: 0, width: playerView4.frame.width * 2, height: playerView4.frame.height * 3)
        
        let subPlayerLayer5 = AVPlayerLayer.init(player: self.player)
        subPlayerLayer5.videoGravity = .resizeAspectFill
        playerView5.setPlayerLayer(layer: subPlayerLayer5)
        playerView5.playerLayer?.frame = CGRect(x: SUB_WIDTH * -1, y: playerView2.frame.height * -1, width: playerView5.frame.width * 2, height: playerView5.frame.height * 3)
        
        let subPlayerLayer6 = AVPlayerLayer.init(player: self.player)
        subPlayerLayer6.videoGravity = .resizeAspectFill
        playerView6.setPlayerLayer(layer: subPlayerLayer6)
        playerView6.playerLayer?.frame = CGRect(x: SUB_WIDTH * -1, y: (SCREEN_HEIGHT - SUB_HEIGHT) * -1, width: playerView6.frame.width * 2, height: playerView6.frame.height * 3)
        
        let subPlayerLayerC = AVPlayerLayer.init(player: self.player)
        playerViewC.setPlayerLayer(layer: subPlayerLayerC)
        playerViewC.leftAnchor.constraint(equalTo: playerView1.rightAnchor, constant: 2).isActive = true
        playerViewC.rightAnchor.constraint(equalTo: playerView4.leftAnchor, constant: -2).isActive = true
        playerViewC.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        playerViewC.heightAnchor.constraint(equalTo: playerViewC.widthAnchor, multiplier: (9 / 16)).isActive = true
        playerViewC.playerLayer?.videoGravity = .resizeAspectFill
        playerViewC.playerLayer?.frame = CGRect(x: 0, y: 0, width: playerViewC.frame.width, height: playerViewC.frame.height)
        
    }
    
}
