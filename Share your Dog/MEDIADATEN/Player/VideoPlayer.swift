//
//  VideoPlayer.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 26.05.23.
//

import AVKit
import SwiftUI

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoURL: URL
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Implement this method if needed
    }
}

struct VideoPlayer: View {
    var body: some View {
        VStack {
            VideoPlayerView(videoURL: URL(string: "Anzeichen.mp4")!)
                .frame(height: 290)
            
            // Add additional UI elements as needed
        }
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer()
    }
}
