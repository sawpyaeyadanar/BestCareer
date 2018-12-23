//
//  CategoriesCollectionViewCell.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 13/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit
import BadgeSwift
import Firebase
class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var jobCount: BadgeSwift!
    @IBOutlet weak var descriptionLabel: UILabel!
    func update(_ cat:Categories){
        let dbRef = Database.database().reference()
        //let jobQuery = dbRef.child("Jobs").queryEqual(toValue: "cat1", childKey: "cat")
        let jobRef = dbRef.child("Jobs")
        //jobRef.queryEqual(toValue: "cat5", childKey: "cat")
         
        jobRef.observe(.value) { (ss) in
            print("***==>",ss)
            if let ssArray = ss.value as? [Any]    {
                let jobPosts = ssArray.filter({ (jp ) -> Bool in
                    let jpdict =  jp as? [String:Any]
                    return  jpdict?.values != nil
                })
                print(jobPosts.count)
                self.jobCount.text = String(describing: jobPosts.count)
            }
        }
        
        //let recentPostsQuery = (ref?.child("posts").queryLimited(toFirst: 100))!
    }
}
