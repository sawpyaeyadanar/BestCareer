//
//  JobDetailCollectionViewController.swift
//  BestCareer
//
//  Created by ZinZinNaing on 12/26/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit

class JobDetailCollectionViewController: UICollectionViewController {
    var jobPosts:JobPost!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func setup(){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.colorFromHex("#9a2163").cgColor,
                           UIColor.colorFromHex("#000000").cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
       self.view.layer.insertSublayer(gradient, at: 0)
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout,
            let collectionView = collectionView {
            let w = collectionView.frame.width - 20
            flowLayout.estimatedItemSize = CGSize(width: w, height: 200)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? JobDetailsCollectionViewCell else {
            return UICollectionViewCell()
        }

        switch indexPath.row {
        case 0:
            cell.titlelbl.text = "Job Function"
            cell.descriptionlbl.text = jobPosts.title
        case 1:
            cell.titlelbl.text = "Gender"
            cell.descriptionlbl.text = jobPosts.gender
        case 2:
            cell.titlelbl.text = "Type"
            cell.descriptionlbl.text = jobPosts.empType
        case 3:
            cell.titlelbl.text = "Location"
            cell.descriptionlbl.text = "Yangon"
        case 4:
            cell.titlelbl.text = "Working Hour"
            cell.descriptionlbl.text = jobPosts.workingHour
        case 5:
            cell.titlelbl.text = "Salary"
            cell.descriptionlbl.text = jobPosts.salary
        case 7:
            cell.titlelbl.text = "Description"
            cell.descriptionlbl.text = jobPosts.jobdescription
        case 6:
            cell.titlelbl.text = "Requirements"
            cell.descriptionlbl.text = jobPosts.requirements
            
        default:
            print("Default")
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}


