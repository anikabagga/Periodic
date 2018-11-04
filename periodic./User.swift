//
//  User.swift
//  periodic.
//
//  Created by Anika Bagga on 11/3/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import Foundation
import UIKit


class User{
    var name : String!
    var username : String!
    var email : String!
    
    init( _ name: String, _ username : String, _ email: String) {
        self.name = name
        self.username = username
        self.email = email
    }
}
