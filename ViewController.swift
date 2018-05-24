
//
//  ViewController.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 5/23/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import UIKit

var deckCollection = [Deck<AnyHashable, Any>]()
var deckName = ""

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
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
        print("pressed")
    }
    
    @IBAction func textFieldPrimaryActionTriggered(_ sender: Any) {
        deckName = textField.text!
        print(deckName)
    }
    
    
    
}

