//
//  Post.swift
//  periodic.
//
//  Created by Anika Bagga on 11/3/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import Foundation
import UIKit

class Post{
    
    var name: String!
    var aboutYou: String!
    var itemsRequested: [String]!
    var uid: String!
    
    init(_ uid: String, postDict: [String:Any]?) {
        self.uid = uid
        if postDict != nil {
            if let name = postDict!["name"] as? String {
                self.name = name
            }
            if let aboutYou = postDict!["aboutYou"] as? String {
                self.aboutYou = aboutYou
            }
            if let itemsRequested = postDict!["itemsRequested"] as? [String] {
                self.itemsRequested = itemsRequested
            }
        }
    }
    
    
    
    
    
    
    
    
}
