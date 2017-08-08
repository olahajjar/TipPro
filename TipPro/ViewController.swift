//
//  ViewController.swift
//  TipPro
//
//  Created by make on 8/2/17.
//  Copyright © 2017 Makeschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    @IBOutlet weak var tipAmountTextField: UITextField!
    
    
    @IBOutlet weak var totalTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didPressCalculate(_ sender: Any) {
        if let billAmount = Double(billAmountTextField.text!) {
            var tipPercentage = 0.0
            
            switch tipSegment.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100*tipAmount)/100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if (!tipAmountTextField.isEditing) {
                tipAmountTextField.text = String(format: "%.2f", roundedBillAmount)
            }
            tipAmountTextField.text = String(format: "%.2f", roundedTipAmount)
            totalTextField.text = String(format: "%.2f", totalAmount)
        } else {
            //show error
            billAmountTextField.text = ""
            tipAmountTextField.text = ""
            totalTextField.text = ""
        }
        
    }
}

