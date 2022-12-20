//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Angel Martinez on 12/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTexField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTexField: UITextField!
    
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
        
        let year = yearSegmentControl.titleForSegment(at: yearSegmentControl.selectedSegmentIndex)
        
        let introduction = "My name is \(firstNameTexField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTexField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Nice to Meet You !", style: .default)
        
        alertController.addAction(action)
        
        present(alertController,animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonStyle()
    }
    
}
