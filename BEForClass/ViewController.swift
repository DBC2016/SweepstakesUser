//
//  ViewController.swift
//  BEForClass
//
//  Created by Thomas Crawford on 5/15/16.
//  Copyright © 2016 VizNetwork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var backendless = Backendless.sharedInstance()
    @IBOutlet weak var firstNameTextField :UITextField!
    @IBOutlet weak var lastNameTextField  :UITextField!
    @IBOutlet weak var phoneTextField     :UITextField!
    @IBOutlet weak var emailTextField     :UITextField!
    @IBOutlet weak var entryButton        :UIBarButtonItem!

    
    //MARK: - Data Methods
    
    private func saveNewEntry(newEntry: Sweepstakes){
        let dataStore = backendless.data.of(Sweepstakes.ofClass())
        dataStore.save(newEntry, response: { (result) in print("To Do Saved")
            
        }) { (fault) in
            print("Server Reported Error:\(fault)")
            
        }
    }
    
    @IBAction private func textFieldChanged() {
        if firstNameTextField.text?.characters.count > 0 && lastNameTextField.text?.characters.count > 0 && (phoneTextField.text?.characters.count > 6 || emailTextField.text?.characters.count > 5) {
            entryButton.enabled = true
        } else {
            entryButton.enabled = false
        }
    }
    
    @IBAction private func addNewEntry(button: UIBarButtonItem) {
        let newEntry = Sweepstakes()
        newEntry.firstName = firstNameTextField.text!
        newEntry.lastName = lastNameTextField.text!
        if let phone = phoneTextField.text {
            newEntry.phoneNumber = phone
        } else {
            newEntry.phoneNumber = ""
        }
        if let email = emailTextField.text {
            newEntry.eMail  = email
        } else {
            newEntry.eMail = ""
        }
        saveNewEntry(newEntry)
        
    }
        
    //MARK: - Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldChanged()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

