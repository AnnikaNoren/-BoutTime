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
import QuartzCore


class ViewController: UIViewController {

    //variables 
    var indexOfSelectedEvent: Int = 0
    var usedIndexes = [Int]()
    var orderOfChoices = [Int]()
    var roundsPlayed: Int = 0
    var roundsPerGame: Int = 6
    var correctAnswers: Int = 0
    
    var yearOfEvent1: Int = 0
    var yearOfEvent2: Int = 0
    var yearOfEvent3: Int = 0
    var yearOfEvent4: Int = 0
    var urlOfEvent1: String = ""
    var urlOfEvent2: String = ""
    var urlOfEvent3: String = ""
    var urlOfEvent4: String = ""
    var urlString: String = ""
    var urlOfEvent: String = ""
    
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
        
        //Tap gestures on 4 labels
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapForMoreInfo(_:)))
        label1.addGestureRecognizer(tapGesture1)
        label1.isUserInteractionEnabled = true

        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.tapForMoreInfo(_:)))
        label2.addGestureRecognizer(tapGesture2)
        label2.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(self.tapForMoreInfo(_:)))
        label3.addGestureRecognizer(tapGesture3)
        label3.isUserInteractionEnabled = true
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(self.tapForMoreInfo(_:)))
        label4.addGestureRecognizer(tapGesture4)
        label4.isUserInteractionEnabled = true

        //play the game
        displayEvent()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "displayScoreSegue"{
            
            let DestViewController1 : DisplayScoreViewController = segue.destination as! DisplayScoreViewController
            DestViewController1.correctAnswer = correctAnswers
            
        } else if segue.identifier == "webDisplaySegue"{
            
            let DestViewController2 : WebDisplayEventViewController = segue.destination as! WebDisplayEventViewController
            urlString = urlOfEvent
            DestViewController2.urlInfo = urlString
            
        }
    }
    
    func tapForMoreInfo(_ sender: UITapGestureRecognizer){

        if (sender.view!.restorationIdentifier == "view1") {
            urlOfEvent = urlOfEvent1
            print("View1 is tapped! \(urlOfEvent1)")
        } else if (sender.view!.restorationIdentifier == "view2") {
            urlOfEvent = urlOfEvent2
            print("View2 is tapped!")
        } else if (sender.view!.restorationIdentifier == "view3") {
            urlOfEvent = urlOfEvent3
            print("View3 is tapped")
        } else if (sender.view!.restorationIdentifier == "view4") {
            urlOfEvent = urlOfEvent4
            print ("view4 is tapped")
        }
        performSegue(withIdentifier: "webDisplaySegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        checkAnswer()
    }
    
    func displayEvent(){
        repeat {
            
        arrayOfEventYears.removeAll()
        correctOrderOfYears.removeAll()
        messageLabel.text = "Shake to complete"
        gameButton.setTitle(" ", for: .normal)
        startTimer()
        
        
        //array of labels to populate with non-repeating events
        let labels = [label1, label2,label3, label4]
        
        for _ in 0..<labels.count {
        
            //get random number, test to see if arlready used, add new randoms to array
            indexOfSelectedEvent = GKRandomSource.sharedRandom().nextInt(upperBound: historicalEvents.events.count)
        
            while usedIndexes.contains(indexOfSelectedEvent) {
                indexOfSelectedEvent = GKRandomSource.sharedRandom().nextInt(upperBound: historicalEvents.events.count)
            }
            
            usedIndexes.append(indexOfSelectedEvent)
        }
        
        
        //get the 4 events and populate the labels
        var event = historicalEvents.events[usedIndexes[0]]
        yearOfEvent1 = event.year
        urlOfEvent1 = event.url
        arrayOfEventYears.append(yearOfEvent1)
        label1.layer.cornerRadius = 5.0
        label1.clipsToBounds = true
        label1.text = event.event
        
        event = historicalEvents.events[usedIndexes[1]]
        yearOfEvent2 = event.year
        arrayOfEventYears.append(yearOfEvent2)
        label2.layer.cornerRadius = 5.0
        label2.clipsToBounds = true
        label2.text = event.event

        
        event = historicalEvents.events[usedIndexes[2]]
        yearOfEvent3 = event.year
        arrayOfEventYears.append(yearOfEvent3)
        label3.layer.cornerRadius = 5.0
        label3.clipsToBounds = true
        label3.text = event.event

        
        event = historicalEvents.events[usedIndexes[3]]
        yearOfEvent4 = event.year
        arrayOfEventYears.append(yearOfEvent4)
        label4.layer.cornerRadius = 5.0
        label4.clipsToBounds = true
        label4.text = event.event
        
        //sort array of events into correct order
        correctOrderOfYears = arrayOfEventYears.sorted()
        } while (correctOrderOfYears == arrayOfEventYears)
    }

    
    @IBAction func moveEvent(_ sender: UIButton) {
        
        orderOfChoices = []
                
        if (sender.tag == 0){
            swap(&label1.text, &label2.text)
            swap(&yearOfEvent1, &yearOfEvent2)
        } else if (sender.tag == 1){
            swap(&label2.text, &label1.text)
            swap(&yearOfEvent2, &yearOfEvent1)
        } else if (sender.tag == 2){
            swap(&label2.text, &label3.text)
            swap(&yearOfEvent2, &yearOfEvent3)
        } else if (sender.tag == 3){
            swap(&label3.text, &label2.text)
            swap(&yearOfEvent3, &yearOfEvent2)
        } else if (sender.tag == 4){
            swap(&label3.text, &label4.text)
            swap(&yearOfEvent3, &yearOfEvent4)
        } else if (sender.tag == 5){
            swap(&label4.text, &label3.text)
            swap(&yearOfEvent4, &yearOfEvent3)
        }

        orderOfChoices += [yearOfEvent1, yearOfEvent2, yearOfEvent3, yearOfEvent4]
    }
    
    func checkAnswer() {
        roundsPlayed += 1
        timer.invalidate()
        
        //Choosing not to do webview
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
            displayScore()
        } else {
        displayEvent()
        }
    }

    
    func displayScore(){
        performSegue(withIdentifier: "displayScoreSegue", sender: self)
    }
    
    
    func startTimer(){
        timerCounter = 0
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    
    func timerAction() {
        timerCounter += 1
        invertedTimerCounter = 60 - timerCounter
        if (invertedTimerCounter >= 10){
            //timerRightWrongLabel.text = "0:\(invertedTimerCounter)"
            gameButton.setTitle("0:\(invertedTimerCounter)", for: .normal)
        } else if (invertedTimerCounter < 10) && (invertedTimerCounter >= 0){
            //timerRightWrongLabel.text = "0:0\(invertedTimerCounter)"
            gameButton.setTitle("0:0\(invertedTimerCounter)", for: .normal)
        } else if (invertedTimerCounter <= 0){
            checkAnswer()
        }
    }

}


