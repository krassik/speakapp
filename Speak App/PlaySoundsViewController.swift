//
//  PlaySoundsViewController.swift
//  Speak App
//
//  Created by krassik on 12/5/14.
//  Copyright (c) 2014 Krassimir Krustev. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        if var filePath = NSBundle.mainBundle().pathForResource("sample", ofType: "mp3") {
//            var filePathURL = NSURL.fileURLWithPath(filePath)
//
//        } else {
//            println("the filePath is empty")
//        }
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        // Play slooooowly audio
        audioPlayer.stop() // good practice
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playFastAudio(sender: AnyObject) {
        // Play fast audio
        audioPlayer.stop() // good practice
        audioPlayer.currentTime = 0.0
        audioPlayer.rate = 2.5
        audioPlayer.play()
    }

    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        
        playAudioWithVariablePitch(1000)
    }
    
    
    @IBAction func stopAudio(sender: AnyObject) {
        audioPlayer.stop()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
