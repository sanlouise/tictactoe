//
//  ViewController.swift
//  Noughts and Crosses
//
//  Created by Sandra Adams-Hallie on Mar/1/16.
//  Copyright © 2016 Sandra Adams-Hallie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // Player one has noughts, player two has crosses.
    
    // Listing all buttons. They can be in three states: 0 is empty, 1 has a nought, 2 has a cross.
    
    
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8], [2, 4, 6]]
    
    
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        // The ID of the button that is tapped can be detected by the button's "tag" which can be set in the storyboard.
        
        // 0 refers to empty
        
        if (gameState[sender.tag] == 0) {
        
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {

                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                
                activePlayer = 2
        
            } else {
            
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            
                activePlayer = 1
            
            }
            
            // Loop through winning combinations
            
            for combination in winningCombinations {
                
                // The first part of this statement checks that not all fields are blank.
                
                // Then it checks to see if three consecutive items are the same and not 0.
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    if gameState[combination[0]] == 1 {
                        
                        print("Noughts is the winner!")
                        
                    } else {
                        
                        print("Victory for crosses!")
                        
                    }
                
                }
                
                
            }
            
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

