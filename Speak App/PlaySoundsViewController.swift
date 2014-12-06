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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if var filePath = NSBundle.mainBundle().pathForResource("sample", ofType: "mp3") {
            var filePathURL = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathURL, error: nil)
            audioPlayer.enableRate = true
        } else {
            println("the filePath is empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        // Play slooooowly audio
        audioPlayer.stop() // good practice
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }
    
    @IBAction func playFastAudio(sender: AnyObject) {
        // Play fast audio
        audioPlayer.stop() // good practice
        audioPlayer.rate = 2.5
        audioPlayer.play()
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
