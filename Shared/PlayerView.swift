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

class PlayerView: UIView {

    var playerLayer : AVPlayerLayer?
    var index : Int = 0
    var centerView : CenterView?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    func setPlayerLayer(layer : AVPlayerLayer) {
        self.playerLayer = layer
        self.layer.addSublayer(self.playerLayer!)
    }
    
    func setCenterView(centerView : CenterView) {
        self.centerView = centerView
    }
    
    @objc
    func handleTap() {
        for subview in superview?.subviews as! [UIView] {
            subview.layer.borderWidth = 0
            subview.layer.borderColor = UIColor.clear.cgColor
        }
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.red.cgColor
        superview?.bringSubviewToFront(self)
        
        self.centerView?.updatePlayerLayer(index: self.index)
    }
}

