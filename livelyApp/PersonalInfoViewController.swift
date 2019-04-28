//
//  PersonalInfoViewController.swift
//  livelyApp
//
//  Created by Karsten Widjanarko on 4/27/19.
//  Copyright © 2019 drunkBrothers. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var heightFtField: UITextField!
    @IBOutlet weak var heightInField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var workoutSlider: UISlider!
    
    @IBAction func workoutVolSlider(_ sender: AnyObject) {
        workoutLabel.text = String(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
