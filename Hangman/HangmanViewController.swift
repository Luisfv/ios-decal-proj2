//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var guessField: UITextField!
   
    @IBAction func guess(sender: AnyObject) {
        if (guessField.text != "") {
            let guess = guessField.text
            guessField.text = ""
            if (guessesMade.text == "Guesses") {
                guessesMade.text = "Guesses\n" + guess! + "\n"
            }
            else {
                guessesMade.text = guessesMade.text! + guess! + "\n"
            }

        }
        self.view.endEditing(true)
    }
    
    @IBAction func newGame(sender: AnyObject) {
        guessField.text = ""
        guessesMade.text = "Guesses"
    }
    
    
    @IBOutlet weak var guessesMade: UILabel!
    
    @IBOutlet weak var screen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("words", ofType: "plist")
        self.guessField.delegate = self
        NSLog(path!)
        
        let image: UIImage = UIImage(named: "hangman.png")!
        screen.image = image
//        screen!.frame = CGRectMake(0,0,100,200)
//        self.view.addSubview(bgImage!)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
}

