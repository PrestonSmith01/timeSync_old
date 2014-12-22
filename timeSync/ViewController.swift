//
//  ViewController.swift
//  timeSync
//
//  Created by Preston Smith on 10/31/14.
//  Copyright (c) 2014 Preston Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tt_timeLine: UIProgressView!
    @IBOutlet var tt_countDown: UILabel!
    
    @IBOutlet var tt_CreateEvent: UIButton!
    @IBOutlet var tt_eventCreateField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    var timeCoordinator = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timeManagementClass"), userInfo: nil, repeats: true)
        
        self.timeManagementClass()
        tt_eventCreateField.hidden = true;
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //This function checks if the countdown has a number less than 10 and adds a 0.
    func pad2(number: Int) -> String {
        var numStr: String = String(number)
        if (number < 10){
            numStr = "0" + numStr
        }
        return numStr
    }
    

    func timeManagementClass(){
        
        // Initial run info
        var tt_currentDate = NSDate()
        var tt_objCalendar = NSCalendar.currentCalendar()
        
        var tt_objDateFormat = tt_objCalendar.components( .CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: tt_currentDate)
        
        
        var tt_hour = tt_objDateFormat.hour
        var tt_minute = tt_objDateFormat.minute
        var tt_second = tt_objDateFormat.second
        
        //Begin label
        tt_countDown.text = "\(pad2(tt_hour)):\(pad2(tt_minute)):\(pad2(tt_second))"
        // end of Countdown Label
        
        
        //Begin progress bar
        
        var currentTime = Float(tt_hour * 3600 + tt_minute * 60 + tt_second)
        var timelinemax = currentTime / 86400.00
        
        tt_timeLine.setProgress(timelinemax, animated: true)
        //End label
        
        //Class time management debug
        
        let debugConsole_TimeManagement = "Function: timeClassManagement || Output: \(timelinemax) || Time: \(String(tt_hour)):\(String(tt_minute))"
        println(debugConsole_TimeManagement)
        
    }
    
    
    @IBAction func createEventButton(sender: AnyObject) {
        
    }
    
    

}

