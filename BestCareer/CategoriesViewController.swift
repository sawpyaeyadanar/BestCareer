//
//  CategoriesViewController.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 13/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit
import LGSideMenuController
import Firebase

class JobPost{
    var id:String
    var title:String
    var companyid:String
    
    init(id:String, title:String, companyid:String) {
        self.id = id
        self.title = title
        self.companyid = companyid 
    }
    
    
}
class Categories {
    
    var name:String?
    var id:String?
    var count:Int = 0
    static var all = Categories()
    
    var posts:[JobPost]?
    func getPostingForCompany(id:String)->[JobPost]{
        
    }
    /*
     Accounting/Finance
     Administrative
     Consulting
     Customer Service/Support
     Design/Architecture
     Driver/Security/Cleaning
     Education/Teaching/Childcare
     Engineering/Technical
     Fitness/Wellbeing
     Food and Beverage
     Hair/Nails and Beauty
     HR/Training and Recruitment
     Hospitality/Tourism
     T Hardware/Software
     Legal
     Logistics/Distribution/Fleet
     Management
     Manufacturing/Warehouse
     Marketing/Media/Creative
     Medical/Doctor/Nursing
     PR/Communications
     Procurement/Sourcing
     Project Management
     Quality Assurance
     Research and Development
     Sales/Business Development
     Science/Technology
     Skilled Trades / Construction
     Strategy/Planning
     Translation
     Voluntary work
     Writing/Editing
     Others
 
 */
    var types = [String]()
    init() {
        types.append("Accounting/Finance")
        types.append("Administrative")
        types.append("Consulting")
        types.append("Customer Service/Support")
        types.append("Design/Architecture")
        types.append("Driver/Security/Cleaning")
        types.append("Education/Teaching/Childcare")
        types.append("Engineering/Technical")
    }
    init(id:String, name:String){
        self.id = id
        self.name = name
    }
    
    func insertType() {
        for (index,data) in types.enumerated() {
            self.name = data
            self.id = String(describing: index)
        }
    }
    
}

class CategoriesViewController: UIViewController {

    @IBOutlet weak var catagoriesCollectionView: UICollectionView!
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    
    var jobCategories = [Categories]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
 
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.colorFromHex("#9a2163").cgColor,
                           UIColor.colorFromHex("#000000").cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
        //CategoriesObj.insertType()
        setCategoryObserver()
    }
    
    func setCategoryObserver( ){
        
        let dbRef = Database.database().reference()
        let catRef = dbRef.child("Categories")
        catRef.observe(.value) { (ss) in
            // print(ss)
            if let cats = ss.value as? [String:Any] {
                self.jobCategories.removeAll()
                for (k,cat) in cats {
                    
                    let theCategoryDict = cat as? [String:Any]
                    let catName = (theCategoryDict?["name"] as? String) ?? "Unknown"
                    let catId = (theCategoryDict?["id"] as? String   ) ?? "UnknownID"
                    let theCat = Categories(id: catId,  name : catName)
                    self.jobCategories.append(theCat)
                }
                self.catagoriesCollectionView.reloadData()
            }
        }
    }
    
    @IBAction func showSideMenu(_ sender: UIBarButtonItem) {
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
    }
    
}
extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobCategories.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentCat =  jobCategories[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesID", for: indexPath) as? CategoriesCollectionViewCell
        cell?.descriptionLabel.text = currentCat.name
        //cell?.jobCount.text = String(describing:  currentCat.count)
        cell?.update(currentCat, callBack: { ( posts ) in
            currentCat.posts = posts
        })
        return cell ?? UICollectionViewCell();
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let theJobCat = self.jobCategories[indexPath.row]
        //print(theJobCat.posts?.count)
          performSegue(withIdentifier: "jobpostsegue", sender: theJobCat)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "jobpostsegue": let destVC =  segue.destination as? JobPostsViewController
        destVC?.jobCategory = sender as? Categories
        default:()
        }
    }
    
}
/*
 
 //code for Menu bar button item; in viewDidLoad
 SWRevealViewController *revealController = [self revealViewController];
 
 UIImage *myImage = [UIImage imageNamed:@"menu-tab.png"];
 myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 
 UIBarButtonItem *rightRevealButtonItem = [[UIBarButtonItem alloc] initWithImage:myImage style:UIBarButtonItemStylePlain target:revealController action:@selector(rightRevealToggle:)];
 
 self.navigationItem.rightBarButtonItem = rightRevealButtonItem;
 
 UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"new-logo"]]];
 self.navigationItem.leftBarButtonItem = item;
 
 */
