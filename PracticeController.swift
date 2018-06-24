//
//  PracticeController.swift
//  CardZap
//
//  Created by Geoffrey Salmon on 6/24/18.
//  Copyright © 2018 Geoffrey Salmon. All rights reserved.
//

import UIKit

var todaysCards = Queue<AnyHashable>()

class PracticeController: UIViewController {
    
    
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todaysCards = theDeck.getTodaysCards()!
        let currentKey = theDeck.todaysCards.dequeue()
        frontLabel.text = currentKey as? String
        backLabel.text = theDeck.get(front: currentKey!) as? String
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotWrongPressed(_ sender: Any) {
        
        
        
    }
    
    @IBAction func checkMinusPressed(_ sender: Any) {
        
        
        
    }
    
    @IBAction func checkPressed(_ sender: Any) {
        
        
        
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
