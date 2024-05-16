//
//  ViewController.swift
//  PlayAudio
//
//  Created by Sandra Gomez on 5/16/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
       loadAudioFile()
    }
    
    func loadAudioFile() {
        guard let audioFilePath = Bundle.main.path(forResource: "MeditationSong", ofType: "mp3") else {
            return
        }
        let audioFileURL = URL(fileURLWithPath: audioFilePath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL, fileTypeHint: nil)
            audioPlayer.numberOfLoops = 0
        } catch {
            print ("AVAudioPlayer error = \(error)")
        }
    }

    @IBAction func stopButton(_ sender: UIButton) {
        audioPlayer.stop()
        loadAudioFile()
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        audioPlayer.play()
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
        audioPlayer.pause()
    }
}

