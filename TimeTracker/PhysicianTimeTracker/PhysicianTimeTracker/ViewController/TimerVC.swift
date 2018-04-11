//
//  TimerViewController.swift
//  PhysicianTimeTracker
//
//  Created by Vedant Tiwari on 3/27/18.
//  Copyright © 2018 ShippertLLC. All rights reserved.
//

import UIKit

class TimerVC: UIViewController {
    var CurrentSessionTime = 0
    var TotalTime = 7500
    var ProcedureTime = 1630
    var timer = Timer()
    var TimerIsRunning = true
    

    @IBOutlet weak var StartTimer: UIButton!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var TotalTimerLabel: UILabel!
    @IBOutlet weak var ProcedureTimerLabel: UILabel!
    @IBAction func timerButtonClicked(_ sender: UIButton) {
        if(TimerIsRunning == false) {
            runTimer()
            sender.setTitle("STOP", for: .normal)
            sender.backgroundColor = .red
        }
        else {
            stopTimer()
            sender.setTitle("START", for: .normal)
            sender.backgroundColor = UIColor(red: 0.1529, green: 0.8392, blue: 0, alpha: 1.0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        runTimer()
        navigationController?.view.backgroundColor = .white
        //self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ScreenWidth = view.frame.width
        let ScreenHeight = view.frame.height
        
        TimerLabel.center = CGPoint(x:view.center.x, y:view.center.y - 200)
        
        
        
        StartTimer.frame = CGRect(x: 0.1*ScreenWidth, y: 0.78*ScreenHeight, width: 0.8*ScreenWidth, height: 0.12*ScreenHeight)
        StartTimer.layer.cornerRadius = 6
        StartTimer.setTitle("STOP", for: .normal)
        StartTimer.backgroundColor = .red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerVC.updateTimer)), userInfo: nil, repeats: true)
        TimerIsRunning = true
    }
    
    func stopTimer() {
        timer.invalidate()
        TimerIsRunning = false
    }
    
    @objc func updateTimer() {
        CurrentSessionTime += 1
        TotalTime += 1
        ProcedureTime += 1
        TimerLabel.text = timeString(time: TimeInterval(CurrentSessionTime))
        TotalTimerLabel.text = timeString(time: TimeInterval(TotalTime))
        ProcedureTimerLabel.text = timeString(time: TimeInterval(ProcedureTime))
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let CurrentSessionTime = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, CurrentSessionTime)
    }
}
