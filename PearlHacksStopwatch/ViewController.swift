//
//  ViewController.swift
//  PearlHacksStopwatch
//
//  Created by Scotty Shaw on 4/1/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var stopwatchButton: UIButton!
    
    @IBAction func toggleStopwatchOnAndOff(sender: AnyObject) {
        
        // start the timer
        if (stopwatchButton.titleLabel?.text == "STOP") {
            stopwatchButton.setTitle("START", forState: UIControlState.Normal)
        }
            
        // stop the timer
        else {
            stopwatchButton.setTitle("STOP", forState: .Normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

