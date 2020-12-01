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
            playerView()
        }
        .background(Color.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct playerView : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MultiAnglePlayerController {
        let controller = MultiAnglePlayerController()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MultiAnglePlayerController, context: Context) {
        
    }
}

