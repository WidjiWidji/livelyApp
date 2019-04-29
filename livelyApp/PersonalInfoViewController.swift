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
    
    
    @IBAction func workoutVolSlider(_ sender: UISlider) {
        workoutLabel.text = String(Int(sender.value))
    }
    
    
    
    //BMI = kg/m2 (weight/height^2)
    func bmiCalc() -> Double{
        let weight = weightField.text!
        let heightFt = heightFtField.text!
        let heightIn = heightInField.text!
        
        let weightInKilogram:Double = (Double(weight))! / 2.205
        let heightInMeters:Double = (Double(heightFt)! / 3.2808) + (Double(heightIn)! * 0.0254)
        
        return weightInKilogram / (heightInMeters * heightInMeters)
    }
    
    
    //alert
    func createAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //calculate BMI button
    @IBAction func calcBmiButton(_ sender: UIButton) {
        if(weightField.text == "") //if weight is empty
        {
            createAlert(title: "Cannot Calculate BMI" , message: "Fill in weight")
        }
        else if (heightFtField.text == "") //if height ft is empty
        {
            createAlert(title: "Cannot Calculate BMI", message: "Fill in height (Ft)")
        }
        else if (heightInField.text == "") //if height in is empty
        {
            heightInField.text = String(0)
        }
        else
        {
            bmiLabel.text = String(Int(bmiCalc()))
        }
    }
    
    let defaults = UserDefaults.standard
    
    struct Keys{
        static let gender        = "userGender"
        static let age           = "userAge"
        static let heightFeet    = "userHeightFt"
        static let heightInches  = "userHeightIn"
        static let weight        = "userWeight"
        static let bmi           = "userBmi"
        static let workoutVolume = "userWorkoutVol"
        static let workoutSlider = "userWorkoutSlider"
    }
    
    //saving all personal info as userDefaults
    @IBAction func saveButton(_ sender: UIButton) {
        

        defaults.set(genderControl.selectedSegmentIndex, forKey: Keys.gender)
        defaults.set(ageField.text, forKey: Keys.age)
        defaults.set(heightFtField.text, forKey: Keys.heightFeet)
        defaults.set(heightInField.text, forKey: Keys.heightInches)
        defaults.set(weightField.text, forKey: Keys.weight)
        defaults.set(bmiLabel.text, forKey: Keys.bmi)
        defaults.set(workoutLabel.text, forKey: Keys.workoutVolume)
        defaults.set(workoutSlider.value, forKey: Keys.workoutSlider)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
        
        if let gender = defaults.object(forKey: "userGender") as? Int
        {
            genderControl.selectedSegmentIndex = gender
        }
        let age = defaults.value(forKey: Keys.age) as? String ?? ""
        ageField.text = age
        let heightFt = defaults.value(forKey: Keys.heightFeet) as? String ?? ""
        heightFtField.text = heightFt
        let heightIn = defaults.value(forKey: Keys.heightInches) as? String ?? ""
        heightInField.text = heightIn
        let weight = defaults.value(forKey: Keys.weight) as? String ?? ""
        weightField.text = weight
        let bmi = defaults.value(forKey: Keys.bmi) as? String ?? ""
        bmiLabel.text = bmi
        let workoutVol = defaults.value(forKey: Keys.workoutVolume) as? String ?? ""
        workoutLabel.text = workoutVol
        let workoutSlide = defaults.object(forKey: Keys.workoutSlider) as? Float
        workoutSlider.value = Float(workoutSlide ?? 0)
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }*/
 

}
