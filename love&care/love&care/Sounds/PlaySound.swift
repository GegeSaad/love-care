//
//  PlaySound.swift
//  love&care
//
//  Created by Engy on 27/05/2023.
//

import SwiftUI
import AVFoundation
var audioPlayer:AVAudioPlayer?
func PlaySound(sound:String,type:String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath : path))
            audioPlayer?.play()
        }catch{
            print("ERROR")

        }
    }
    
    
}
