//
//  DisplayScoreViewController.swift
//  BoutTime
//
//  Created by Annika Noren on 2/28/17.
//  Copyright © 2017 Annika Noren. All rights reserved.
//

import Foundation
import UIKit

class DisplayScoreViewController: UIViewController {

    @IBOutlet weak var displayScore: UILabel!
    //this is correctAnswer not correctAnswerS
    var correctAnswer = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //displayScore.text = "\(correctAnswers)/6"
        displayScore.text = "\(correctAnswer)/6"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
