//
//  JobDetailsCollectionViewCell.swift
//  BestCareer
//
//  Created by ZinZinNaing on 12/26/18.
//  Copyright © 2018 Saw Pyae Yadanar. All rights reserved.
//

import UIKit

class JobDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var descriptionlbl: UILabel!
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    
}
