//
//  HydrationViewController.swift
//  livelyApp
//
//  Created by Karsten Widjanarko on 4/28/19.
//  Copyright © 2019 drunkBrothers. All rights reserved.
//

import UIKit



class HydrationViewController: UIViewController {

    
    @IBOutlet weak var percentageTextLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var waterField: UITextField!
    
    
    
    var amountDrank: Double = 0.0
    var recommended = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
        // Do any additional setup after loading the view, typically from a nib.
        //recommended = defaults.standard.double(forKey: "userWeight") / 2 * 8
        percentageTextLabel.text = "\(amountDrank) out of \(recommended)oz"
    }
    
    func recommendedWaterCalc(weight:Int) -> Double{
        var waterCalc: Double = 0.0
        waterCalc = Double(weight) / Double(2 * 8)
        return waterCalc
    }
    
    
    @IBAction func addWater(_ sender: Any) {
        let amount = Double(waterField.text!) ?? 0
        amountDrank += amount
        
        let percentage = Int(amountDrank / recommended * 100)
        
        percentageLabel.text = "\(percentage)%"
        percentageTextLabel.text = "\(amountDrank) out of \(recommended)oz"
        
        waterField.text = ""
        
    }

}
