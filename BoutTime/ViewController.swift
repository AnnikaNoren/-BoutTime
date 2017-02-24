//
//  ViewController.swift
//  BoutTime
//
//  Created by Annika Noren on 2/20/17.
//  Copyright © 2017 Annika Noren. All rights reserved.
//

import UIKit
import Foundation
import GameKit

class ViewController: UIViewController {

    //variables 
    var indexOfSelectedEvent: Int = 0
    var usedIndexes = [Int]()
    var orderOfChoices = [Int]()
    
    var yearOfEvent1: Int = 0
    var yearOfEvent2: Int = 0
    var yearOfEvent3: Int = 0
    var yearOfEvent4: Int = 0
    
    var arrayOfEventYears = [Int]()
    var correctOrderOfYears = [Int]()
    
    //create an instance of the HistoricalEvent
    let historicalEvents = HistoricalEvents()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2Up: UIButton!
    @IBOutlet weak var button2Down: UIButton!
    @IBOutlet weak var button3Up: UIButton!
    @IBOutlet weak var button3Down: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    //setting up timer
    var timer = Timer()
    var timerCounter = 0
    var invertedTimerCounter = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayEvent()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Device was shaken!")
    }
    
    func displayEvent(){
        messageLabel.text = "Shake to complete"
        gameButton.setTitle(" ", for: .normal)
        startTimer()
        
        //array of labels to populate with non-repeating events
        let labels = [label1, label2,label3, label4]
        
        for _ in 0..<labels.count {
        
            //get random number
            indexOfSelectedEvent = GKRandomSource.sharedRandom().nextInt(upperBound: historicalEvents.events.count)
        
        
            //test to see if random has already been used, get another random until an unused one is found
            while usedIndexes.contains(indexOfSelectedEvent) {
                indexOfSelectedEvent = GKRandomSource.sharedRandom().nextInt(upperBound: historicalEvents.events.count)
            }
        
            //add the used random to the index
            usedIndexes.append(indexOfSelectedEvent)
        }
        
        
            //get an event
            //let event = historicalEvents.events[indexOfSelectedEvent]
            //labels[i]?.text = event.event
            //label1.text = event.event
        
        
        var event = historicalEvents.events[usedIndexes[0]]
        yearOfEvent1 = event.year
        arrayOfEventYears.append(yearOfEvent1)
        label1.text = event.event
        
        event = historicalEvents.events[usedIndexes[1]]
        yearOfEvent2 = event.year
        arrayOfEventYears.append(yearOfEvent2)
        label2.text = event.event
        
        event = historicalEvents.events[usedIndexes[2]]
        yearOfEvent3 = event.year
        arrayOfEventYears.append(yearOfEvent3)
        label3.text = event.event
        
        event = historicalEvents.events[usedIndexes[3]]
        yearOfEvent4 = event.year
        arrayOfEventYears.append(yearOfEvent4)
        label4.text = event.event
        
        print(arrayOfEventYears)
        
        //sort array into correct order
        //correctOrderOfIndexes = usedIndexes.sorted()
        correctOrderOfYears = arrayOfEventYears.sorted()
        //print(correctOrderOfIndexes)
        print(correctOrderOfYears)
    }
    
    
    @IBAction func moveEvent(_ sender: UIButton) {
        orderOfChoices = []
        if (sender.tag == 0){
            button1.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .highlighted)
            swap(&label1.text, &label2.text)
            swap(&yearOfEvent1, &yearOfEvent2)
        } else if (sender.tag == 1){
            button2Up.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
            swap(&label2.text, &label1.text)
            swap(&yearOfEvent2, &yearOfEvent1)
        } else if (sender.tag == 2){
            button2Down.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
            swap(&label2.text, &label3.text)
            swap(&yearOfEvent2, &yearOfEvent3)
        } else if (sender.tag == 3){
            button3Up.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
            swap(&label3.text, &label2.text)
            swap(&yearOfEvent3, &yearOfEvent2)
        } else if (sender.tag == 4){
            button3Down.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
            swap(&label3.text, &label4.text)
            swap(&yearOfEvent3, &yearOfEvent4)
        } else if (sender.tag == 5){
            button4.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .highlighted)
            swap(&label4.text, &label3.text)
            swap(&yearOfEvent4, &yearOfEvent3)
        }
        
        orderOfChoices += [yearOfEvent1, yearOfEvent2, yearOfEvent3, yearOfEvent4]
        print("CORRECT ORDER: \(orderOfChoices)")
        if (orderOfChoices == correctOrderOfYears){
            print("EQUALS")
        } else {
            print("NOT EQUAL")
        }
        
    }
    
    func startTimer(){
        timerCounter = 0
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    
    func timerAction() {
        timerCounter += 1
        invertedTimerCounter = 20 - timerCounter
        if (invertedTimerCounter >= 10){
            gameButton.setTitle("0:\(invertedTimerCounter)", for: .normal)
        } else if (invertedTimerCounter < 10) && (invertedTimerCounter >= 0){
            gameButton.setTitle("0:0\(invertedTimerCounter)", for: .normal)
        } else if (invertedTimerCounter == 0){
            timer.invalidate()
        }
        //messageLabel.text = "\(timerCounter)"
    }

    
    
    
}

