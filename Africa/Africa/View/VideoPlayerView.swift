//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Alexander Rojas Benavides on 9/22/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - Properties
    var videoSelected: String
    var videoTitle: String
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected)) {
                Text(videoTitle)
            }
            .overlay(Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8), alignment: .topLeading)
        }//: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
