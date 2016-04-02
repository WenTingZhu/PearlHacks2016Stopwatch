//
//  ViewController.swift
//  PearlHacksStopwatch
//
//  Created by Scotty Shaw on 4/1/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var startTime = NSTimeInterval()
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var stopwatchButton: UIButton!
    
    @IBAction func toggleStopwatchOnAndOff(sender: AnyObject) {
        
        // start the timer
        if (!timer.valid) {
            stopwatchButton.setTitle("STOP", forState: .Normal)
            
            let repeatingFunction: Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
            
        // stop the timer
        else {
            stopwatchButton.setTitle("START", forState: .Normal)
            
            timer.invalidate()
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
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        // calculate elapsed time
        let elapsedTime = currentTime - startTime
        
        timeLabel.text = "\(elapsedTime)"
    }

}

