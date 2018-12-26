//
//  JobPostCell.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 21/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit

class JobPostCell: UICollectionViewCell {
    
    var jobPost:JobPost!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var salarylbl: UILabel!
    @IBOutlet weak var locationlbl: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var companyLogoImg: UIImageView!
    
    func config(){
    title.text = jobPost.title
    salarylbl.text = "Salary "  + jobPost.salary
    locationlbl.text = jobPost.location
    gender.text = jobPost.gender
    
    
    }
    
}

