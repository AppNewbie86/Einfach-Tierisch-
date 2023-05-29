//
//  TopicView.swift
//  Share your Dog
//
//  Created by Marcel Zimmermann on 13.05.23.
//

import SwiftUI
import AVKit


struct TopicView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let player: AVPlayer
    var topic: String = "Anzeichen\nfür Erkrankungen"
    
    init() {
        guard let videoURL = Bundle.main.url(forResource: "Anzeichen", withExtension: "mp4") else {
            fatalError("Video URL not found")
        }
        
        self.player = AVPlayer(url: videoURL)
        self.player.isMuted = true
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.brown.opacity(0.10), .brown.opacity(0.77)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(topic)
                    .font(.title)
                
                VideoPlayer()
                    .frame(height: 280) // Ändere die Höhe des Playerfensters hier nach Bedarf
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
                    .ignoresSafeArea()
                
                Text("Videozusammenfassung")
                    .bold()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                Text("Hier stellen wir euch in einem kurzen Video\nvor, wie man erkennen kann, ob ein\nHund an einer möglichen Erkrankung\nerkrankt ist und schnellstmöglichst\nvom Tierarzt des Vertrauens\nuntersucht werden sollte.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView()
    }
}
