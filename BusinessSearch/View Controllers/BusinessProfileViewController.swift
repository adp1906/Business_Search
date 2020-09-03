//
//  BusinessProfileViewController.swift
//  BusinessSearch
//
//  Created by Aaron Peterson on 7/7/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class BusinessProfileViewController: UIViewController {
    
    var business: Business?
    let profileImage = UIImageView()
    let testButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("API Test", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        
        configureProfileImage()
        setUpTestButton()
    }
    
    func setUpTestButton() {
        view.addSubview(testButton)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 100).isActive = true
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
    }
    
    @objc func testButtonTapped() {
        print("Print API Data")
    }
    
    func configureProfileImage() {
        guard let photo = business?.profileImage else { return }
        profileImage.image = photo
        view.addSubview(profileImage)
        profileImage.layer.masksToBounds = true
        profileImage.contentMode = .scaleAspectFill
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor, multiplier: 0.65).isActive = true
    }


}
