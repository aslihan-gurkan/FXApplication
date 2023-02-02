//
//  ViewController.swift
//  FXApplication
//
//  Created by Aslıhan Gürkan on 1.02.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && emailText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error == nil {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                } else {
                    self.makeAlert(title: "Error", message: "Cannot Sign In. Please check your email or password.")
                }
            }
        } else {
            self.makeAlert(title: "Error", message: "Error!")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                if error == nil {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                } else {
                    self.makeAlert(title: "Error", message: "Error")
                }
            }
        } else {
            self.makeAlert(title: "Error", message: "Error")
        }
    }
    
    func makeAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

