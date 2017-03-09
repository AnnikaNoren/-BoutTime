//
//  WebDisplayEventViewController.swift
//  BoutTime
//
//  Created by Annika Noren on 3/6/17.
//  Copyright © 2017 Annika Noren. All rights reserved.
//

import UIKit
import Foundation

class WebDisplayEventViewController: UIViewController {

    @IBOutlet weak var WebViewLabel: UIWebView!
    
    @IBAction func dismissWebDisplay(_ sender: AnyObject) {
        dismiss(animated: true)
    }
    
    var urlInfo = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let url = NSURL (string: urlInfo);
        let request = NSURLRequest(url: url! as URL)
        
        WebViewLabel.loadRequest(request as URLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
