//
//  CenterView.swift
//  SwiftUI_Playgroud
//
//  Created by Hey Fisher on 2020/12/01.
//

import Foundation
import AVKit
import AVFoundation
import UIKit

class CenterView: UIView {

    var playerLayer : AVPlayerLayer?
    var index : Int = 0
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        self.clipsToBounds = true
    }
    
    func setPlayerLayer(layer : AVPlayerLayer) {
        self.playerLayer = layer
        self.layer.addSublayer(self.playerLayer!)
    }

    override func layoutSubviews() {
        
        if self.index == 1 {
            self.playerLayer?.frame = CGRect(x: 0, y: 0, width: self.frame.width * 2, height: self.frame.height * 3)
        }else if self.index == 2 {
            self.playerLayer?.frame = CGRect(x: 0, y: self.frame.height * -1, width: self.frame.width * 2, height: self.frame.height * 3)
        }else if self.index == 3 {
            self.playerLayer?.frame = CGRect(x: 0, y: self.frame.height * -2, width: self.frame.width * 2, height: self.frame.height * 3)
        }else if self.index == 4 {
            self.playerLayer?.frame = CGRect(x: self.frame.width * -1, y: 0, width: self.frame.width * 2, height: self.frame.height * 3)
        }else if self.index == 5 {
            self.playerLayer?.frame = CGRect(x: self.frame.width * -1, y: self.frame.height * -1, width: self.frame.width * 2, height: self.frame.height * 3)
        }else if self.index == 6 {
            self.playerLayer?.frame = CGRect(x: self.frame.width * -1, y: self.frame.height * -2, width: self.frame.width * 2, height: self.frame.height * 3)
        }else {
            self.playerLayer?.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        }
    }
    
    func updatePlayerLayer(index: Int) {
        self.index = index
        layoutSubviews()
    }
    
}
