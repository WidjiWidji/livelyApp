//
//  PersonalInfoViewController.swift
//  livelyApp
//
//  Created by Karsten Widjanarko on 4/27/19.
//  Copyright © 2019 drunkBrothers. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func HideKeyboard(){
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }
    
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
    
}

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
    @IBAction func saveButton(_ sender: UIButton) {
        UserDefaults.standard.set(genderControl.selectedSegmentIndex, forKey: "userGender")
        UserDefaults.standard.set(ageField.text, forKey: "userAge")
        UserDefaults.standard.set(heightFtField.text, forKey: "userHeightFt")
        UserDefaults.standard.set(heightInField.text, forKey: "userHeightIn")
        UserDefaults.standard.set(weightField.text, forKey: "userWeight")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let gender = UserDefaults.standard.object(forKey: "userGender") as? Int
        {
            genderControl.selectedSegmentIndex = gender
        }
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
