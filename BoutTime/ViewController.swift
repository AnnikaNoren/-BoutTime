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
    var roundsPlayed: Int = 0
    var roundsPerGame: Int = 3
    var correctAnswers: Int = 0
    
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
    
    //color
    let swiftDarkBlue = UIColor(red: 0, green: 0, blue: 45/255, alpha: 1)
    let swiftMedBlue = UIColor(red: 71/255, green: 179/255, blue: 255/255, alpha: 1)

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
        checkAnswer()
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
        
        
        //get the 4 events and populate the labels
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
        
        //sort array of events into correct order
        correctOrderOfYears = arrayOfEventYears.sorted()
    }
    
    
    @IBAction func moveEvent(_ sender: UIButton) {
        
        //FIXME: need to put in order as displayed, in case it is correct
        orderOfChoices = []
        
        if (sender.tag == 0){
           // button1.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .highlighted)
            swap(&label1.text, &label2.text)
            swap(&yearOfEvent1, &yearOfEvent2)
        } else if (sender.tag == 1){
            //button2Up.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
            swap(&label2.text, &label1.text)
            swap(&yearOfEvent2, &yearOfEvent1)
        } else if (sender.tag == 2){
            //button2Down.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
            swap(&label2.text, &label3.text)
            swap(&yearOfEvent2, &yearOfEvent3)
        } else if (sender.tag == 3){
           // button3Up.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
            swap(&label3.text, &label2.text)
            swap(&yearOfEvent3, &yearOfEvent2)
        } else if (sender.tag == 4){
           // button3Down.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
            swap(&label3.text, &label4.text)
            swap(&yearOfEvent3, &yearOfEvent4)
        } else if (sender.tag == 5){
           // button4.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .highlighted)
            swap(&label4.text, &label3.text)
            swap(&yearOfEvent4, &yearOfEvent3)
        }
        
        orderOfChoices += [yearOfEvent1, yearOfEvent2, yearOfEvent3, yearOfEvent4]
    }
    
    func checkAnswer() {
        roundsPlayed += 1
        timer.invalidate()
        messageLabel.text = "Tap event to learn more"
        if (orderOfChoices == correctOrderOfYears){
            gameButton.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
            correctAnswers += 1
            print(correctAnswers)
        } else {
            gameButton.setImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        //empty arrays and reset images
        usedIndexes.removeAll()
        orderOfChoices.removeAll()
        arrayOfEventYears.removeAll()
        correctOrderOfYears.removeAll()
        gameButton.setImage(nil, for: .normal)
        
        nextRound()
    }
    
    func nextRound() {
        if roundsPlayed == roundsPerGame {
            print("Game over")
            displayScore()
        } else {
        // Continue game
        displayEvent()
        }
    }

    func displayScore(){
        //hide label1 & 4
        label1.backgroundColor = swiftDarkBlue
        label2.backgroundColor = swiftDarkBlue
        label3.backgroundColor = swiftDarkBlue
        label4.backgroundColor = swiftDarkBlue
        
        //make 2 and 3 blue with text medium blue and white
        label2.textColor = swiftMedBlue
        label3.textColor = UIColor.white
        label2.text = "Your score"
        label3.text = "\(correctAnswers)"
        
        //hide images
        button1.setImage(nil, for: .normal)
        button1.setTitle(nil, for: .normal)
        
        button2Up.setImage(nil, for: .normal)
        button2Up.setTitle(nil, for: .normal)
        
        button2Down.setImage(nil, for: .normal)
        button2Down.setTitle(nil, for: .normal)
        
        button3Up.setImage(nil, for: .normal)
        button3Up.setTitle(nil, for: .normal)
        
        button3Down.setImage(nil, for: .normal)
        button3Down.setTitle(nil, for: .normal)
        
        button4.setImage(nil, for: .normal)
        button4.setTitle(nil, for: .normal)
        
        //hide  messageLabel
        messageLabel.text = ""
        
        //display "play again" button
        gameButton.setImage(#imageLiteral(resourceName: "play_again"), for: .normal)
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
            //timerRightWrongLabel.text = "0:\(invertedTimerCounter)"
            gameButton.setTitle("0:\(invertedTimerCounter)", for: .normal)
        } else if (invertedTimerCounter < 10) && (invertedTimerCounter >= 0){
            //timerRightWrongLabel.text = "0:0\(invertedTimerCounter)"
            gameButton.setTitle("0:0\(invertedTimerCounter)", for: .normal)
        } else if (invertedTimerCounter <= 0){
            checkAnswer()
        }
        //messageLabel.text = "\(timerCounter)"
    }

}


