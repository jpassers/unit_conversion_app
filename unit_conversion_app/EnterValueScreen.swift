//
//  EnterValueScreen.swift
//  unit_conversion_app
//
//  Created by James on 19/04/2019.
//  Copyright © 2019 James. All rights reserved.
//

import UIKit
import Foundation

class EnterValueScreen: UIViewController {

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }
    
    // outlet fields
    @IBOutlet weak var enterValue: UITextField!
    var val: Double!
    var convertedVal: Double!
    var weightBool: Bool = true
    var weightName: String!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        enterValue.resignFirstResponder()
    }

    @IBAction func enterValueTouch(_ sender: UITextField) {
    }
    
    @IBAction func indexedWeight(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            weightBool = true
            enterValue.placeholder = "Kilos"
        case 1:
            weightBool = false
            enterValue.placeholder = "Pounds"
        default:
            weightBool = true
            enterValue.placeholder = "Kilos"
        }
    }
    
    func convertEquations(_ weight: Bool, insertValueFromTextField value: Double) -> Double {
        
        if weight == true {
            print("we doin Kgs")
            convertedVal = 2.20462 * value
            weightName = "Ibs"
        } else {
            print("we doin lbs")
            convertedVal = value / 2.20462
            weightName = "Kgs"
        }
        convertedVal = convertedVal.roundToDecimal(2)
        return convertedVal
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        //execute function converter
        
        val = Double(enterValue.text ?? "0")
        convertEquations(weightBool, insertValueFromTextField: val)
        outputLabel.text = String(convertedVal) + " \(weightName!)"
    }
}

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

