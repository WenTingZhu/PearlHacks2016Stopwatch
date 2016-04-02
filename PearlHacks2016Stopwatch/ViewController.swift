//
//  ViewController.swift
//  PearlHacks2016Stopwatch
//
//  Created by Scotty Shaw on 4/1/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // global variables
    
    var sliderValue: CGFloat!
    
    var startTime = NSTimeInterval()
    
    var timer = NSTimer()
    
    // IBOutlet variables
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var stopwatchButton: UIButton!
    
    @IBOutlet weak var switcher: UISwitch!
    
    // IBAction functions and supporting functions
    
    @IBAction func adjustTimeLabelFontSize(sender: AnyObject) {
        let fontSizeAdjustment = stepper.value * 0.8
        timeLabel.font = UIFont(name: timeLabel.font.fontName, size: 17.0 * CGFloat(fontSizeAdjustment))
    }
    
    @IBAction func adjustTimeLabelTextColor(sender: AnyObject) {
        sliderValue = CGFloat(slider.value)
        timeLabel.textColor = UIColor(red: sliderValue, green: sliderValue / 2.0, blue: sliderValue / 1.5, alpha: 1.0)
    }
    
    @IBAction func switchBackgroundColor(sender: AnyObject) {
        if (switcher.on) {
            self.view.backgroundColor = UIColor.yellowColor()
        }
        else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    @IBAction func toggleStopwatchOnAndOff(sender: AnyObject) {
        
        // start the timer
        if (!timer.valid) {
            startTimer()
        }
        
        // stop the timer
        else {
            stopTimer()
        }
    }
    
    func startTimer() {
        stopwatchButton.setTitle("STOP", forState: .Normal)
        validateTimer()
        activityIndicatorView.startAnimating()
    }
    
    func validateTimer() {
        let repeatingFunction: Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
    }
    
    func stopTimer() {
        stopwatchButton.setTitle("START", forState: .Normal)
        timer.invalidate()
        activityIndicatorView.stopAnimating()
    }
    
    // override functions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        adjustTimeLabelTextColor(slider)
        switchBackgroundColor(switcher)
        updateProgressView(0.0)
        adjustTimeLabelFontSize(stepper)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // non-IBAction functions
    
    func updateProgressView(elapsedTime: NSTimeInterval) {
        let completedProgress = Float(elapsedTime) / 10.0
        let isProgressViewAnimated = (elapsedTime != 0.0)
        
        progressView.setProgress(completedProgress, animated: isProgressViewAnimated)
    }
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        // calculate elapsed time
        var elapsedTime = currentTime - startTime
        
        updateProgressView(elapsedTime)
        
        // calculate elapsed minutes
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= NSTimeInterval(minutes) * 60.0
        
        // calculate elapsed seconds
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        // calculate elasped milliseconds
        let milliseconds = UInt8(elapsedTime * 100)
        
        // add the leading zero for minutes, seconds and milliseconds and store them as string constants
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        // concatenate minutes, seconds and milliseconds and assign them to the UILabel
        timeLabel.text = "\(strMinutes):\(strSeconds):\(strMilliseconds)"
    }
}
