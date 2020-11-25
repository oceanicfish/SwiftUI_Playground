//
//  MultiAnglePlayerController.swift
//  SwiftUI_Playgroud (iOS)
//
//  Created by Hey Fisher on 2020/11/25.
//

import Foundation
import UIKit

class MultiAnglePlayerController : UIViewController {
    
    let playerView: PlayerView = {
        let h = UIScreen.main.bounds.width * 9 / 16
//        let playerViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: h)
        let playerViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 2, height: h / 2)
        let playerView = PlayerView.init(frame: playerViewFrame)
        playerView.backgroundColor = .black
        playerView.clipsToBounds = true
//        playerView.translatesAutoresizingMaskIntoConstraints = false
        return playerView
    }()
    
    let playerView2: PlayerView2 = {
        let h = UIScreen.main.bounds.width * 9 / 16
//        let playerViewFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: h)
        let playerViewFrame = CGRect(x: UIScreen.main.bounds.width / 2, y: h / 2, width: UIScreen.main.bounds.width / 2, height: h / 2)
        let playerView2 = PlayerView2.init(frame: playerViewFrame)
        playerView2.backgroundColor = .black
        playerView2.clipsToBounds = true
//        playerView.translatesAutoresizingMaskIntoConstraints = false
        return playerView2
    }()
    
//    let playerView2: PlayerView = {
//        let h = UIScreen.main.bounds.width * 9 / 16
//        let playerViewFrame = CGRect(x: 0, y: h + 10, width: UIScreen.main.bounds.width, height: h)
//        let playerView2 = PlayerView.init(frame: playerViewFrame)
//        playerView2.backgroundColor = .black
////        playerView.translatesAutoresizingMaskIntoConstraints = false
//        return playerView2
//    }()
    
    override func viewDidLoad() {
        
        self.view.addSubview(playerView)
        self.view.addSubview(playerView2)
        
        
    }
    
}
