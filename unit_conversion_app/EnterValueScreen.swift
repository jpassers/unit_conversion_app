//
//  EnterValueScreen.swift
//  unit_conversion_app
//
//  Created by James on 19/04/2019.
//  Copyright © 2019 James. All rights reserved.
//

import UIKit

class EnterValueScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
        // outlet fields
    
    
    @IBOutlet weak var enterValue: UITextField!
    var val: Double!
    var convertedVal: Double!
    var weightBool: Bool = true
    var weightName: String!
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    //outputField.text = ans
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        enterValue.resignFirstResponder()
    }

    @IBAction func enterValueTouch(_ sender: UITextField) {
    }
    
    
    @IBAction func indexedWeight(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            weightBool = true
        case 1:
            weightBool = false
        default:
            weightBool = true
        }
    }
    
    func convertEquations(_ weight: Bool, insertValueFromTextField value: Double) -> Double {
        
        if weight == true {
            print("we doin Kgs")
            convertedVal = 2.20462 * value
            weightName = "Pounds"
            
            
        } else {
            print("we doin lbs")
            convertedVal = value / 2.20462
            weightName = "Kilos"
        }
        
        return convertedVal.rounded(toPlaced: 1)
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        //execute function converter
        
        val = Double(enterValue.text ?? "0")
        
        convertEquations(weightBool, insertValueFromTextField: val)
        
        outputLabel.text = String(convertedVal) + " \(weightName!)"
    }
}


extension Double {
    func rounded(toPlaced places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
