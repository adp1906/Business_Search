//
//  BusinessCollectionViewCell.swift
//  BusinessSearch
//
//  Created by Aaron Peterson on 7/6/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class BusinessCollectionViewCell: BaseCell {
    let nameLabel = UILabel()
    let profileImage = UIImageView()
    
    var business: Business? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let business = business else { return }
        nameLabel.text = business.name
        profileImage.image = business.profileImage
    }
    
    override func setupViews() {
        configureImageView()
        configureNameLabel()
    }
    
    func configureImageView() {
        addSubview(profileImage)
        profileImage.layer.masksToBounds = true
        profileImage.contentMode = .scaleAspectFill
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        profileImage.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65).isActive = true
    }
    
    func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.text = "Business Name"
        nameLabel.textAlignment = .left
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
    }
}
