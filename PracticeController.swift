//
//  PracticeController.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 6/24/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import UIKit

class PracticeController: UIViewController {
    
    let deckTitle = deckName
    var currentKey = theDeck.unseenCards.get()
    var DOA = false
    
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var checkMinusButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.selectedItem = tabBar.items![0]
        navBar.topItem?.title = deckTitle
        backLabel.isHidden = true
        totalLabel.text = String(theDeck.unseenCards.size() + theDeck.missedCards.size()) + " unlearned"
        remainingLabel.text = String(theDeck.todaysCards.size()) + " scheduled"
        
        let frontText = currentKey!.theContent
        let backText = theDeck.get(front: currentKey!)!.theContent
        
        print("frontText: " + frontText)
        print("backText: " + backText)
        
        frontLabel.text = frontText
        backLabel.text = backText
        
        wrongButton.isEnabled = false
        checkMinusButton.isEnabled = false
        checkButton.isEnabled = false
        
        if(theDeck.todaysCards.size() == 0) {
            DOA = true
            print("dead on arrival")
        }
        nextCard()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showBack(_ sender: Any) {
        if(backLabel.isHidden) {
            backLabel.isHidden = false
            wrongButton.isEnabled = true;
            checkMinusButton.isEnabled = true;
            checkButton.isEnabled = true;
        }
    }
    
    @IBAction func gotWrongPressed(_ sender: Any) {
        if(DOA) {
            theDeck.unseenCards.enqueue(currentKey!)
        } else {
            theDeck.missedCards.enqueue(currentKey!)
        }
        nextCard()
    }
    
    @IBAction func checkMinusPressed(_ sender: Any) {
        //theDeck.schedule[1].enqueue(currentKey!)
        nextCard()
    }
    
    @IBAction func checkPressed(_ sender: Any) {
        //theDeck.schedule[3].enqueue(currentKey!)
        nextCard()
    }
    
    func nextCard() {
        if(theDeck.unseenCards.size() == 0) {
            theDeck.loadUnseenCards()
            nextCard()
        } else {
            
            remainingLabel.text = String(theDeck.todaysCards.size()) + " scheduled"
            totalLabel.text = String(theDeck.unseenCards.size() + theDeck.missedCards.size()) + " unlearned"
            
            printUsefulInformation()
            
            if(theDeck.todaysCards.size() > 0) {
                currentKey = theDeck.todaysCards.dequeue()
            } else if(theDeck.missedCards.size() > 0) {
                currentKey = theDeck.missedCards.dequeue()
            } else if(theDeck.unseenCards.size() > 0) {
                currentKey = theDeck.unseenCards.dequeue()
            }
            
            let frontText = currentKey?.theContent
            let backText = theDeck.get(front: currentKey!)!.theContent
            
            frontLabel.text = frontText
            backLabel.text = backText
            backLabel.isHidden = true
            
            wrongButton.isEnabled = false
            checkMinusButton.isEnabled = false
            checkButton.isEnabled = false
        }
    }
    
    func printUsefulInformation()  {
        print("unseenSize: " + String(theDeck.unseenCards.size()))
        print("missedSize: " + String(theDeck.missedCards.size()))
        print("todaysSize: " + String(theDeck.todaysCards.size()))
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
