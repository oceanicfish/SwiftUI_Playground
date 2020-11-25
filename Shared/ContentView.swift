//
//  ContentView.swift
//  Shared
//
//  Created by Hey Fisher on 2020/11/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    var body: some View {
        VStack {
            playerView().frame(height: UIScreen.main.bounds.height / 3)
            Spacer()
        }
        .background(Color.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

//struct playerView : UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let controller = AVPlayerViewController()
//        let mPlayer = AVPlayer(url: URL(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!)
//        controller.player = mPlayer
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
//
//    }
//}

struct playerView : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MultiAnglePlayerController {
        let controller = MultiAnglePlayerController()
//        let mPlayer = AVPlayer(url: URL(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!)
//        controller.player = mPlayer
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MultiAnglePlayerController, context: Context) {
        
    }
}

