//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Angel Martinez on 12/19/22.
//

import UIKit

class ViewController: UIViewController {

    let userDefaults = UserDefaults.standard

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var yearSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var morePetsStepper: UIStepper!
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBOutlet weak var introduceYourselfButton: UIButton!
    
    
    func buttonStyle() {
        introduceYourselfButton.configuration = .bordered()
        introduceYourselfButton.configuration?.title = "Introduce Yourself"
        introduceYourselfButton.configuration?.baseForegroundColor = .white
        introduceYourselfButton.configuration?.baseBackgroundColor = UIColor(named: "blueColor")
        introduceYourselfButton.configuration?.cornerStyle = .capsule
    }
    
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        userDefaults.set(firstNameTextField.text, forKey: "firstKey")
        userDefaults.set(lastNameTextField.text, forKey: "lastKey")
        userDefaults.set(schoolNameTextField.text, forKey: "schoolKey")
        userDefaults.set(numberOfPetsLabel.text, forKey: "petKey")
       
        let year = yearSegmentControl.titleForSegment(at: yearSegmentControl.selectedSegmentIndex)
        
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Nice to Meet You !", style: .default)
        
        alertController.addAction(action)
        
        present(alertController,animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonStyle()
        textFieldsUpdate()
        yearSegmentUpdate()
        petSwitchUpdate()

    }
    
    
    //Persistence Using UserDefaults (All text fields)
    func textFieldsUpdate() {
        let first = userDefaults.string(forKey: "firstKey")
        let last  = userDefaults.string(forKey: "lastKey")
        let school = userDefaults.string(forKey: "schoolKey")
        let totalPets = userDefaults.string(forKey: "petKey")
        if first != nil {
            firstNameTextField.text = first
        }
        else
        {
            firstNameTextField.text = ""
        }
        if last != nil {
            lastNameTextField.text = last
        }
        else
        {
            lastNameTextField.text = ""
        }
        if school != nil {
            schoolNameTextField.text = school
        }
        else
        {
            schoolNameTextField.text = school
        }
        if totalPets != nil {
            numberOfPetsLabel.text = totalPets
        }
        else
        {
            numberOfPetsLabel.text = "0"
        }
    }
    
    //Saves state of Switch using SwitchedKey
    func petSwitchUpdate() {
        if(userDefaults.bool(forKey: "SwitchedKey"))
        {
            morePetsSwitch.setOn(true, animated: false)
        }
        else
        {
            morePetsSwitch.setOn(false, animated: false)
        }
    }
    
    //Checks the status of switch being on or off
    @IBAction func MorePetsSwitch(_ sender: UISwitch) {
        if(morePetsSwitch.isOn)
        {
            userDefaults.set(true, forKey: "SwitchedKey")
        }
        else
        {
            userDefaults.set(false, forKey: "SwitchedKey")
        }
    }
    
    //Segment is being checked if previous selection is the same selection
    func yearSegmentUpdate()
    {
        let changedYear = userDefaults.string(forKey: "yearsKey")
        if(changedYear == "firstYearKey")
        {
            yearSegmentControl.selectedSegmentIndex = 0
        }
        else if(changedYear == "secondYearKey")
        {
            yearSegmentControl.selectedSegmentIndex = 1
        }
        else if(changedYear == "thirdYearKey")
        {
            yearSegmentControl.selectedSegmentIndex = 2
        }
        else if(changedYear == "fourthYearKey")
        {
            yearSegmentControl.selectedSegmentIndex = 3
        }
    }
    
    
    //Segment is being saved by cases since there is 4 options of school year
    @IBAction func yearSegmentChanged(_ sender: Any) {
        switch yearSegmentControl.selectedSegmentIndex
        {
        case 0:
            userDefaults.set("firstYearKey", forKey: "yearsKey")
        case 1:
            userDefaults.set("secondYearKey", forKey: "yearsKey")
        case 2:
            userDefaults.set("thirdYearKey", forKey: "yearsKey")
        case 3:
            userDefaults.set("fourthYearKey", forKey: "yearsKey")
        default:
            userDefaults.set("firstYearKey", forKey: "yearsKey")
        }
       //calls update segment to make finalization
        yearSegmentUpdate()
    }
   
    
}
