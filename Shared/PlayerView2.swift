//
//  PlayerView.swift
//  SwiftUI_Playgroud
//
//  Created by Hey Fisher on 2020/11/25.
//

import Foundation
import SwiftUI
import AVKit
import AVFoundation

class PlayerView2: UIView {

    var player : AVPlayer?
    var playerLayer : AVPlayerLayer?
    var playerLayer2 : AVPlayerLayer?
    let url = "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8";

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let h = UIScreen.main.bounds.width * 9 / 16
        
        if let mediaUrl = URL(string: url) {
            self.player = AVPlayer(url: mediaUrl)
            self.playerLayer = AVPlayerLayer(player: self.player!)
//            self.playerLayer2 = AVPlayerLayer(player: self.player!)
            self.layer.addSublayer(self.playerLayer!)
//            self.layer.addSublayer(self.playerLayer2!)
            let povitPointX = -(UIScreen.main.bounds.width / 2)
            let povitPointY = -(h / 2)
            self.playerLayer!.frame = CGRect(x: povitPointX, y: povitPointY, width: UIScreen.main.bounds.width, height: h)
//            self.playerLayer2!.frame = CGRect(x: self.frame.width / 2, y: self.frame.height / 2, width: self.frame.width / 2, height: self.frame.height / 2)
            self.player!.play()
        }
    }

}

