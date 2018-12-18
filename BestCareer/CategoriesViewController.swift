//
//  CategoriesViewController.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 13/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit

class Categories {
    var name:String?
    var id:String?
    static var all = Categories()

    
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
    let CategoriesObj = Categories()
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesObj.insertType()
        if revealViewController() != nil {
            btnMenuButton.target = revealViewController()
            btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
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
    

}
extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoriesObj.types.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesID", for: indexPath) as? CategoriesCollectionViewCell
        cell?.descriptionLabel.text = CategoriesObj.types[indexPath.row]
        cell?.jobCount.text = "218"
        return cell ?? UICollectionViewCell();
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
