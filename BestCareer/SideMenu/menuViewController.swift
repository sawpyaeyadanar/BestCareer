//
//  menuViewController.swift
//  memuDemo
//
//  Created by Parth Changela on 09/10/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit
 
import Firebase
class menuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var tblTableView: UITableView!
    //@IBOutlet weak var imgProfile: UIImageView!
    
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ManuNameArray = ["Home","Favourite","Search","About","Logout"]
        iconArray = [UIImage(named:"home-filled")!,UIImage(named:"heart-outline")!,UIImage(named:"search")!,UIImage(named:"about")!,UIImage(named:"signout")!]
        let name = UserDefaults.standard.string(forKey: "username") ?? ""
        userNamelbl.text = name
//        imgProfile.layer.borderWidth = 2
//        imgProfile.layer.borderColor = UIColor.green.cgColor
//        imgProfile.layer.cornerRadius = 50
//        
//        imgProfile.layer.masksToBounds = false
//        imgProfile.clipsToBounds = true
        tblTableView.tableFooterView = UIView()
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.colorFromHex("#9a2163").cgColor,
                           UIColor.colorFromHex("#000000").cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManuNameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.lblMenuname.text! = ManuNameArray[indexPath.row]
        cell.imgIcon.image = iconArray[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
//        print(cell.lblMenuname.text!)
//        if cell.lblMenuname.text! == "Home"
//        {
//            print("Home Tapped")
//            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
//            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
//            
//        }
//        if cell.lblMenuname.text! == "Logout"
//        {
//            try! Auth.auth().signOut()
//            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
//            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
//            newFrontController.navigationBar.isHidden = true
//           //revealviewcontroller.setFront(newFrontController, animated: true)
//         //   self.navigationController?.setViewControllers([newViewcontroller], animated: false)
//        }
        
        let mainViewController = sideMenuController
        let navCtrl = mainViewController?.rootViewController as? UINavigationController
        let exeStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:if let vc = exeStoryBoard.instantiateViewController(withIdentifier: "CategoriesViewController") as?      CategoriesViewController {
            navCtrl?.pushViewController(vc, animated: true)
        }
        mainViewController?.hideLeftView( animated: true, completionHandler: nil)
        case 4:do {
            try Auth.auth().signOut()
            mainViewController?.dismiss(animated: true, completion: nil)
        } catch {
            print("Error in logout")
            }
        default:break;
        }
    }

}
