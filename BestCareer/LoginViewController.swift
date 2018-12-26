//
//  LoginViewController.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 14/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import SkyFloatingLabelTextField
import LGSideMenuController
import SVProgressHUD
class LoginViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    //secret id //1d134536f12fc2b3a58bac3e0a31b2c4
  
    @IBOutlet weak var userNameField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordField: SkyFloatingLabelTextField!
    @IBOutlet weak var forgotpwdlbl: UILabel!
    @IBOutlet weak var signuplbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    func setup() {
        userNameField.delegate = self
        passwordField.delegate = self
        loginBtn.backgroundColor = UIColor.clear
        forgotpwdlbl.textColor = UIColor.white
        signuplbl.textColor = UIColor.white
        
        forgotpwdlbl.attributedText = changeTextColor(text: forgotpwdlbl.text!, colortext: "Recover here")
        signuplbl.attributedText = changeTextColor(text: signuplbl.text!, colortext: "Signup here")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(didTapLabelDemo))
        tap.numberOfTapsRequired = 1
        signuplbl.addGestureRecognizer(tap)
        tap.delegate = self
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.colorFromHex("#9a2163").cgColor,
                           UIColor.colorFromHex("#000000").cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func addAuthenticationListener() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let _ =  user {
                print("addStateDidChangee")
                SVProgressHUD.dismiss()
                self.navToHome()
            }   
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addAuthenticationListener()
    }
    
    
    
    @objc func didTapLabelDemo(sender: UITapGestureRecognizer)
    {
        print("you tapped label \(sender)")
        performSegue(withIdentifier: "signupsegue", sender: nil)
    }
    
    func changeTextColor(text:String, colortext:String) -> NSMutableAttributedString{
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: text)
        attributedString.setColorForText(textForAttribute: colortext, withColor: UIColor.yellow)
        //label.font = UIFont.boldSystemFont(ofSize: 20)
        return attributedString
        //label.attributedText = attributedString
    
    }
    
    func navToHome() {
        let sb =  UIStoryboard(name: "Main", bundle: nil)
        if  let homeVC = sb.instantiateInitialViewController() as?  LGSideMenuController {
            present(homeVC, animated: true, completion: nil)
        }
    }
    @IBAction func clickLogin(_ sender: Any) {
        dismissKeyboard()
        //SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: self.userNameField.text!, password: self.passwordField.text!) { (user, error ) in
            print("login success")
        }
    }
    
    @IBAction func loginWithFB(_ sender: UIButton) {
        let categoriesVC = CategoriesViewController()
        self.navToHome()
//        self.present(categoriesVC, animated: false, completion: nil)
//        self.navigationController?.setViewControllers([categoriesVC], animated: false)
//         self.navigationController?.pushViewController(categoriesVC, animated: false)
//        let permissionArray = ["public_profile","email"]
//        let fbLoginManager = FBSDKLoginManager()
//        fbLoginManager.logIn(withReadPermissions: permissionArray, from: self) { (loginresult, err) in
//            if err == nil {
//                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
//                Auth.auth().signIn(with: credential, completion: { (user, err) in
//                    if err == nil {
//                        print("Login success")
//                        // print(user)
//                    } else {
//                        print(err?.localizedDescription)
//                    }
//                })
//            } else {
//                print(err?.localizedDescription)
//            }
//        }
//
//
        
    }
    
    func dismissKeyboard() {
        self.userNameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
    }
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == self.userNameField){
            self.passwordField.becomeFirstResponder()
        }else if (textField == self.passwordField){
           clickLogin(self.passwordField)
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


//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            if user != nil {
//            }
//            if let name = self.userNameField.text!.components(separatedBy: CharacterSet(charactersIn: ("@0123456789"))).first {
//               UserDefaults.standard.set(name, forKey: "username")
//            }
//            self.navToHome()

// self.performSegue(withIdentifier: "loginsegue", sender: nil)
