//
//  JobPostsViewController.swift
//  BestCareer
//
//  Created by Saw Pyae Yadanar on 21/12/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit

class JobPostsViewController: UIViewController {
    @IBOutlet weak var jobPosts: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension JobPostsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "jobpostcell", for: indexPath)
        return cell
    }
    
    
}
