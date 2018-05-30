//
//  NewDeckViewController.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 5/24/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import UIKit

class NewDeckViewController: UIViewController {
    
    var theDeck = Deck<AnyHashable, Any>()
    
    let deckTitle = deckName
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var frontTextView: UITextView!
    @IBOutlet weak var backTextView: UITextView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = deckTitle
        theDeck.name = deckTitle
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandler(gesture:)))
        stackView.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    @objc func tapHandler(gesture: UITapGestureRecognizer) {
        frontTextView.resignFirstResponder()
        backTextView.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func xButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backHome", sender: self)
    }

    @IBAction func addCardButtonPressed(_ sender: Any) {
        if(!(frontTextView.text! == "")) {
            if(!(backTextView.text! == "")) {
                let front = frontTextView.text!
                let back = backTextView.text!
                theDeck.add(front: front, back: back)
                frontTextView.text = ""
                backTextView.text = ""
                
            }
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        var index = 0
        for (key,value) in theDeck.theDeck {
            print(String(index))
            print(key)
            print(value)
            index += 1
        }
        theDeck.loadTodaysCards()
        while !theDeck.todaysCards.isEmpty() {
            let currentKey = theDeck.todaysCards.dequeue()
            let currentValue = theDeck.theDeck[currentKey!]!
            print(currentKey!)
            print(currentValue)
        }
        deckCollection.append(theDeck)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
