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
    
    //saving all personal info as userDefaults
    @IBAction func saveButton(_ sender: UIButton) {
        
        UserDefaults.standard.set(genderControl.selectedSegmentIndex, forKey: "userGender")
        UserDefaults.standard.set(ageField.text, forKey: "userAge")
        UserDefaults.standard.set(heightFtField.text, forKey: "userHeightFt")
        UserDefaults.standard.set(heightInField.text, forKey: "userHeightIn")
        UserDefaults.standard.set(weightField.text, forKey: "userWeight")
        UserDefaults.standard.set(bmiLabel.text, forKey: "userBmi")
        UserDefaults.standard.set(workoutLabel.text, forKey: "userWorkoutVol")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.HideKeyboard()
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let gender = UserDefaults.standard.object(forKey: "userGender") as? Int
        {
            genderControl.selectedSegmentIndex = gender
        }
        if let age = UserDefaults.standard.object(forKey: "userAge") as? Int
        {
            ageField.text = String(age)
        }
        if let heightFeet = UserDefaults.standard.object(forKey: "userHeightFt") as? Int
        {
            heightFtField.text = String(heightFeet)
        }
        if let heightInches = UserDefaults.standard.object(forKey: "userHeightIn") as? Int
        {
            heightInField.text = String(heightInches)
        }
        if let weight = UserDefaults.standard.object(forKey: "userWeight") as? Int
        {
            weightField.text = String(weight)
        }
        if let bmi = UserDefaults.standard.object(forKey: "userBmi") as? Int
        {
            bmiLabel.text = String(bmi)
        }
        if let workoutVolume = UserDefaults.standard.object(forKey: "userWorkoutVol") as? Int
        {
            workoutLabel.text = String(workoutVolume)
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
