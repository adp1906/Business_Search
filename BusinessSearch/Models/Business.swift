//
//  Business.swift
//  BusinessSearch
//
//  Created by Aaron Peterson on 7/6/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import Foundation
import UIKit

struct Business {
    let name: String
    let profileImage: UIImage
    let profileImageName: String
    
    init(businessName: String, imageName: String) {
        self.name = businessName
        self.profileImage = UIImage(named: imageName)!
        self.profileImageName = imageName
    }
}
