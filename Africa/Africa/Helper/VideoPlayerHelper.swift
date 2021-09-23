//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Alexander Rojas Benavides on 9/22/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String) -> AVPlayer {
  
    if Bundle.main.url(forResource: fileName, withExtension: "mp4") != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: "mp4")!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
