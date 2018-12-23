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
    func update(_ cat:Categories,callBack:@escaping ([JobPost])->()){
        let dbRef = Database.database().reference()
        //let jobQuery = dbRef.child("Jobs").queryEqual(toValue: "cat1", childKey: "cat")
        let jobRef = dbRef.child("Jobs").child(cat.id ?? "")
        //jobRef.queryEqual(toValue: "cat5", childKey: "cat")
        
        jobRef.observe(.value) { (ss) in
            
                self.jobCount.text = String(describing: ss.children.allObjects.count)
            var jobposts = [JobPost]()
            for obj in ss.children.allObjects as! [DataSnapshot] {
                
                let theDict = obj.value as? [String:Any]
                let companyid = theDict?["companyid"] as? Int
                let name =  theDict?["name"] as? String
                let id = obj.key
                if let companyid  = companyid , let name = name {
                    let jobpost = JobPost(id: id, title: name, companyid: String(companyid))
                    jobposts.append(jobpost)
                }
                
            }
            callBack(jobposts)
            
        }
        
        //let recentPostsQuery = (ref?.child("posts").queryLimited(toFirst: 100))!
    }
}
