//
//  SignUpViewController.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 19/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var confirmpwdField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailField: SkyFloatingLabelTextField!
    @IBOutlet weak var signupBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        confirmpwdField.delegate = self
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.colorFromHex("#9a2163").cgColor,
                           UIColor.colorFromHex("#000000").cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
        self.signupBtn.backgroundColor = UIColor.clear
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickSignup(_ sender: Any) {
        dismissKeyboard()
        Auth.auth().createUser(withEmail: self.emailField.text!, password: self.passwordField.text!) { (authResult, error) in
     //       self.hideSpinner {
                guard let email = authResult?.user.email, error == nil else {
               //     self.showMessagePrompt(error!.localizedDescription)
                    return
                }
                print("\(email) created")
                self.navigationController!.popViewController(animated: true)
      //      }
            // [END_EXCLUDE]
            guard let user = authResult?.user else { return }
        }
    }
    
    

}

extension SignUpViewController: UITextFieldDelegate {
    func dismissKeyboard() {
        self.emailField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        self.confirmpwdField.resignFirstResponder()
    }
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == self.emailField){
            self.passwordField.becomeFirstResponder()
        }else if (textField == self.passwordField){
            clickSignup(self.passwordField)
        }
        return false
    }
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
