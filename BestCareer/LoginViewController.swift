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
class LoginViewController: UIViewController {
    //secret id //1d134536f12fc2b3a58bac3e0a31b2c4
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [hexStringToUIColor(hex: "#9a2163").cgColor,
                           hexStringToUIColor(hex: "#000000").cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    @IBAction func loginWithFB(_ sender: UIButton) {
        let categoriesVC = CategoriesViewController()
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

}
