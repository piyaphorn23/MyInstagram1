//
//  ViewController.swift
//  MyInstagram
//
//  Created by Paethai Akarajariyakul on 3/2/16.
//  Copyright © 2016 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonSignUp_OnClick() {
        if txtPassword.text == txtConfirmPassword.text{
            let kumuAPI = Kumulos()
            kumuAPI.createUserWithUsername(txtUsername.text, andPassword: txtPassword.text, andEmail: txtEmail.text, andAuthData: "test")
        }
    }

    @IBAction func buttonCancel_OnClick() {
        txtUsername.text = ""
        txtPassword.text = ""
        txtEmail.text = ""
        txtConfirmPassword.text = ""
    }
}

