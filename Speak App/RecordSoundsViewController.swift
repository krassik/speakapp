//
//  RecordSoundsViewController.swift
//  Speak App
//
//  Created by krassik on 12/5/14.
//  Copyright (c) 2014 Krassimir Krustev. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        // Hide the stop button
        stopButton.hidden = true
        recordButton.enabled = true
    }

    @IBAction func recordAudio(sender: UIButton) {
        recordingInProgress.hidden = false
        stopButton.hidden = false
        recordButton.enabled = false
        //TODO: record the user's voice
        println("in recordAudio")
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        recordingInProgress.hidden = true
        stopButton.hidden = true
    }
    
}
