//
//  ViewController.swift
//  Timer App (07284)
//
//  Created by Jerry Joy on 2024-02-20.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    @IBOutlet weak var progress: UIProgressView!
    
    var secondsPassed = 0.0
    var timer = Timer()
    var totalTime = 0.0
    var audioPlayer: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        progress.progress = 0.0
        totalTime = 3
        
        self.secondsPassed = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                self.progress.progress = Float(self.secondsPassed)/Float(self.totalTime)
            } else {
                self.playAudio()
                Timer.invalidate()
                
            }
        }
    }
    
    func playAudio(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false){
            (_) in
            self.audioPlayer?.stop()
            
        }
        
    }
    
}

