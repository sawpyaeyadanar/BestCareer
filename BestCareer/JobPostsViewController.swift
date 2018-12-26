//
//  JobPostsViewController.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 21/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit

class JobPostsViewController: UIViewController {
    
    var jobCategory:Categories!
    
    @IBOutlet weak var jobPosts: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
     //   addJobObserver( )
        
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
    }
}

extension JobPostsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobCategory.posts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "jobpostcell", for: indexPath) as? JobPostCell
        cell?.jobPost = jobCategory.posts[indexPath.row]
        cell?.config()
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "jobDetails", sender: jobCategory.posts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "jobDetails": let destVC =  segue.destination as? JobDetailCollectionViewController
        destVC?.jobPosts = sender as? JobPost
        default:()
        }
    }
    
    
}
