//
//  ViewController.swift
//  Prework
//
//  Created by Cheng Xue on 7/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        tipControl.selectedSegmentIndex = 0
    }

//    @IBAction func onBillChange(_ sender: UITextField) {
//        let bill = Double(billAmountTextField.text!) ?? 0
//        
//        let tip = bill * 0.15
//        tipAmountLabel.text = String(format:"$%.2f", tip)
//    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
       
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
    
    @IBAction func partySizeControl(_ sender: UIStepper) {
        let numOfPeople = Int(sender.value)
        partySize.text = String(numOfPeople)

    }
    @IBAction func CalculateFinal(_ sender: UIButton) {
        let numOfPeople = Double(partySize.text!) ?? 1
        print("number of people", numOfPeople)
        let strTotal = totalLabel.text!
        let index = strTotal.index(strTotal.startIndex, offsetBy: 1)
        let total = strTotal[index...]
        splitAmount.text = String(format:"$%.2f", (Double(total) ?? 0)/numOfPeople)
    }
}

