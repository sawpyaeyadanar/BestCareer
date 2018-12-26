//
//  ServerManager.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 24/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import Foundation
import Firebase

class ServerManager {
    static var shared = ServerManager()
    func getData(childName:String,callback: @escaping(_ datasnapshot:Any)-> Void){
        let dbRef = Database.database().reference()
        let catRef = dbRef.child(childName)
        
        catRef.observe(.value) { (ss) in
            // print(ss)
            callback(ss.value)
//            if let cats = ss.value as? [String:Any] {
//                self.jobCategories.removeAll()
//                for (k,cat) in cats {
//
//                    let theCategoryDict = cat as? [String:Any]
//                    let catName = (theCategoryDict?["name"] as? String) ?? "Unknown"
//                    let catId = (theCategoryDict?["id"] as? String   ) ?? "UnknownID"
//                    let theCat = Categories(id: catId,  name : catName)
//                    self.jobCategories.append(theCat)
//                }
//                self.catagoriesCollectionView.reloadData()
//                print(">>>>>",cats)
//            }
        }
    }
}


