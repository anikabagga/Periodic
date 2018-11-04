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
    var uid : String!
    var firstName : String!
    var phoneNumber : String!
    var email : String!
    var isDonor: Bool!
    
    init(_ uid: String, _ name: String, _ email: String, _ phoneNumber: String, _ isDonor: Bool) {
        self.uid = uid
        self.firstName = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.isDonor = isDonor
    }
    
    var dictValue: [String: Any] {
        return ["uid": self.uid, "firstName": self.firstName, "phoneNumber": self.phoneNumber, "email": self.email, "isDonar": self.isDonor]
    }
}
