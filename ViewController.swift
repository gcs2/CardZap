//
//  ViewController.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 5/23/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import UIKit

var deckCollection = [Deck<AnyHashable, Any>]()

class ViewController: UIViewController {
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        nameView.isHidden = false
        navBar.topItem?.title = "Test"
        print("pressed")
    }
    
}

