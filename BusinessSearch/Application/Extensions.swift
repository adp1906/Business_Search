//
//  Extensions.swift
//  BusinessSearch
//
//  Created by Aaron Peterson on 7/7/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}
}
