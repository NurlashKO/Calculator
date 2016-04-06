//
//  ViewController.swift
//  Calculator
//
//  Created by Nurlan on 03/04/2016.
//  Copyright © 2016 Nurlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!
    var typingNum: Bool = false
    var brain = CalculatorBrain()

    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            typingNum = false
        }
    }

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if (typingNum) {
            display.text = display.text! + digit
        } else {
            display.text = digit
            typingNum = true;
        }
    }

    @IBAction func operate(sender: UIButton) {
        if typingNum {
            enter(nil)
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }


    @IBAction func enter(sender: UIButton?) {
        typingNum = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }


}

